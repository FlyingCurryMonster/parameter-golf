#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
python_bin="$repo_root/.venv/bin/python"
log_dir="$repo_root/bash_scripts/output_logs"
log_file="$log_dir/train_smoke_$(date +%Y%m%d_%H%M%S).log"

mkdir -p "$log_dir"
exec > >(tee -a "$log_file") 2>&1

RUN_ID=train_smoke \
ITERATIONS=200 \
TRAIN_BATCH_TOKENS=8192 \
VAL_LOSS_EVERY=0 \
VAL_BATCH_SIZE=8192 \
# "$python_bin" "$repo_root/train_gpt_mlx.py"
"$python_bin" "$repo_root/train_gpt.py"
