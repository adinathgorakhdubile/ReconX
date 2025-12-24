#!/bin/bash

generate_report() {
  target=$1
  OUT="output/$target"
  REPORT="$OUT/report.md"

  {
    echo "# ReconX Report"
    echo
    echo "## Target: $target"
    echo "## Date: $(date)"
    echo

    echo "## Open Ports"
    [[ -f "$OUT/active/open_ports.txt" ]] && cat "$OUT/active/open_ports.txt"
    echo

    echo "## Web Hosts"
    [[ -f "$OUT/web/live.txt" ]] && cat "$OUT/web/live.txt"
    echo

    echo "## Vulnerabilities"
    [[ -f "$OUT/vuln/nuclei.json" ]] && jq -r '.info.severity + " | " + .info.name' "$OUT/vuln/nuclei.json"
  } > "$REPORT"

  log "[REPORT] Report generated"
}
