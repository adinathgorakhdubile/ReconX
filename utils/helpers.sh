#!/bin/bash

tool_exists() {
  command -v "$1" >/dev/null 2>&1
}

check_root() {
  [[ $EUID -ne 0 ]] && echo "[!] Running without root may limit scans"
}
run_parallel() {
  for cmd in "$@"; do
    eval "$cmd" &
  done
  wait
}
