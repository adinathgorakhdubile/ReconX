#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
MODE="normal"

source "$BASE_DIR/utils/logger.sh"
source "$BASE_DIR/utils/helpers.sh"
source "$BASE_DIR/utils/banner.sh"

source "$BASE_DIR/modules/passive.sh"
source "$BASE_DIR/modules/dns.sh"
source "$BASE_DIR/modules/active.sh"
source "$BASE_DIR/modules/web.sh"
source "$BASE_DIR/modules/enum.sh"
source "$BASE_DIR/modules/vuln.sh"
source "$BASE_DIR/modules/report.sh"

show_banner
check_root

usage() {
  echo "Usage: ./reconx.sh -t <target> [--passive|--dns|--active|--enum|--vuln|--report|--full] [--bb]"
  exit 0
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -t|--target) TARGET="$2"; shift 2 ;;
    --passive) RUN_PASSIVE=true; shift ;;
    --dns) RUN_DNS=true; shift ;;
    --active) RUN_ACTIVE=true; shift ;;
    --enum) RUN_ENUM=true; shift ;;
    --vuln) RUN_VULN=true; shift ;;
    --report) RUN_REPORT=true; shift ;;
    --bb) MODE="bugbounty"; shift ;;
    --full) RUN_FULL=true; shift ;;
    -h|--help) usage ;;
    *) usage ;;
  esac
done

[[ -z "$TARGET" ]] && usage

mkdir -p output/$TARGET logs
log "Target set to: $TARGET"

# 🔥 EXECUTION FLOW (FIXED & COMPLETE)
if [[ "$RUN_FULL" == true ]]; then
  passive_recon "$TARGET"
  dns_recon "$TARGET"
  active_recon "$TARGET"
  enum_recon "$TARGET"
  vuln_scan "$TARGET"
  generate_report "$TARGET"

elif [[ "$RUN_PASSIVE" == true ]]; then
  passive_recon "$TARGET"

elif [[ "$RUN_DNS" == true ]]; then
  dns_recon "$TARGET"

elif [[ "$RUN_ACTIVE" == true ]]; then
  active_recon "$TARGET"

elif [[ "$RUN_ENUM" == true ]]; then
  enum_recon "$TARGET"

elif [[ "$RUN_VULN" == true ]]; then
  vuln_scan "$TARGET"

elif [[ "$RUN_REPORT" == true ]]; then
  generate_report "$TARGET"
else
  usage
fi
