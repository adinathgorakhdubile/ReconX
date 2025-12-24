#!/bin/bash
LOG_FILE="logs/reconx.log"

log() {
  echo "[$(date '+%F %T')] $1" | tee -a "$LOG_FILE"
}
