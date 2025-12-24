#!/bin/bash

vuln_scan() {
  target=$1
  LIVE="output/$target/web/live.txt"
  OUT="output/$target/vuln"
  mkdir -p "$OUT"

  log "[VULN] Starting vulnerability discovery"

  [[ ! -f "$LIVE" ]] && return
  tool_exists nuclei || return

  nuclei -l "$LIVE" \
         -severity high,critical \
         -jsonl \
         -o "$OUT/nuclei.json"

  log "[VULN] Vulnerability scan completed"
}
