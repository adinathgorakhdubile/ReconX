#!/bin/bash

dns_recon() {
  domain=$1
  OUT="output/$domain/dns"
  mkdir -p "$OUT"

  log "[DNS] Starting DNS reconnaissance (parallel)"

  run_parallel \
    "dig NS \"$domain\" +short > \"$OUT/ns.txt\"" \
    "dig MX \"$domain\" +short > \"$OUT/mx.txt\"" \
    "dig TXT \"$domain\" +short > \"$OUT/txt.txt\"" \
    "dig A \"$domain\" +short > \"$OUT/a.txt\"" \
    "dig AAAA \"$domain\" +short > \"$OUT/aaaa.txt\""

  for ns in $(cat "$OUT/ns.txt" 2>/dev/null); do
    dig AXFR "$domain" @"$ns" > "$OUT/axfr_$ns.txt" 2>/dev/null &
  done
  wait

  log "[DNS] DNS recon completed"
}