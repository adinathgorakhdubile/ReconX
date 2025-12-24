#!/bin/bash

enum_recon() {
  target=$1
  SERVICES="output/$target/active/services.txt"
  OUT="output/$target/enum"
  mkdir -p "$OUT"

  log "[ENUM] Starting smart enumeration"

  [[ ! -f "$SERVICES" ]] && return

  grep -qi "http" "$SERVICES" && web_recon "$target"
  grep -qi "ftp" "$SERVICES" && nc -nv "$target" 21 > "$OUT/ftp.txt" 2>/dev/null
  grep -qi "ssh" "$SERVICES" && nc -nv "$target" 22 > "$OUT/ssh.txt" 2>/dev/null

  if grep -qi "smb" "$SERVICES" && tool_exists enum4linux; then
    enum4linux "$target" > "$OUT/smb.txt"
  fi

  log "[ENUM] Enumeration completed"
}
