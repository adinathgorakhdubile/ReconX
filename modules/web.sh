#!/bin/bash

web_recon() {
  target=$1
  OUT="output/$target/web"
  mkdir -p "$OUT"

  log "[WEB] Starting web reconnaissance"

  if tool_exists httpx; then
    echo "$target" | httpx > "$OUT/live.txt"
  else
    log "[WEB] httpx not installed – skipping"
    return
  fi

  tool_exists whatweb && whatweb -i "$OUT/live.txt" > "$OUT/whatweb.txt"

  if tool_exists ffuf; then
    THREADS=50
    [[ "$MODE" == "bugbounty" ]] && THREADS=10

    ffuf -u "https://$target/FUZZ" \
         -w wordlists/common.txt \
         -mc 200,301,302,401,403 \
         -t "$THREADS" \
         -o "$OUT/ffuf.json" \
         -of json
  fi

  log "[WEB] Web recon completed"
}
