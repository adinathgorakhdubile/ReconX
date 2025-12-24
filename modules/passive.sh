#!/bin/bash

passive_recon() {
  domain=$1
  OUT="output/$domain/passive"
  mkdir -p "$OUT"

  log "[PASSIVE] Starting passive reconnaissance (parallel)"

  CMDS=()

  CMDS+=("whois \"$domain\" > \"$OUT/whois.txt\" 2>/dev/null")

  if tool_exists subfinder; then
    CMDS+=("subfinder -d \"$domain\" -silent > \"$OUT/subfinder.txt\"")
  fi

  if tool_exists amass; then
    CMDS+=("amass enum -passive -d \"$domain\" > \"$OUT/amass.txt\"")
  fi

  CMDS+=("curl -s \"https://crt.sh/?q=%25.$domain&output=json\" \
           | jq -r '.[].name_value' 2>/dev/null \
           | sed 's/\\*\\.//' \
           | sort -u > \"$OUT/crtsh.txt\"")

  run_parallel "${CMDS[@]}"

  cat "$OUT"/*.txt 2>/dev/null | grep "$domain" | sort -u > "$OUT/subdomains.txt"

  log "[PASSIVE] Passive recon completed"
}
