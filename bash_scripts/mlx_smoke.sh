#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
python_bin="$repo_root/.venv/bin/python"

RUN_ID=mlx_smoke \
ITERATIONS=200 \
TRAIN_BATCH_TOKENS=8192 \
VAL_LOSS_EVERY=0 \
VAL_BATCH_SIZE=8192 \
# "$python_bin" "$repo_root/train_gpt_mlx.py"
# "$python_bin" "$repo_root/train_gpt_mlx.py"
