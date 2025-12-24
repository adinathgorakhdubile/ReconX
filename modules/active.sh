#!/bin/bash

active_recon() {
  target=$1
  OUT="output/$target/active"
  mkdir -p "$OUT"

  log "[ACTIVE] Starting active reconnaissance"

  if [[ "$MODE" == "bugbounty" ]]; then
    nmap -p 80,443,8080 "$target" -oN "$OUT/ports_all.txt"
  else
    nmap -p- --min-rate 1000 -T4 "$target" -oN "$OUT/ports_all.txt"
  fi

  grep open "$OUT/ports_all.txt" \
    | awk -F/ '{print $1}' \
    | tr '\n' ',' \
    | sed 's/,$//' > "$OUT/open_ports.txt"

  PORTS=$(cat "$OUT/open_ports.txt")
  [[ -z "$PORTS" ]] && return

  nmap -sC -sV -p "$PORTS" "$target" -oN "$OUT/services.txt"

  log "[ACTIVE] Active recon completed"
}
