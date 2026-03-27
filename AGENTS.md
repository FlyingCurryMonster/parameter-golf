# Repository Guidelines

## Project Structure & Module Organization

Root training entrypoints live in `train_gpt.py` (PyTorch baseline) and `train_gpt_mlx.py` (MLX baseline). Data download and retokenization helpers live in `data/`, with published shard layout documented in `data/README.md`. Use `bash_scripts/` for small local helpers such as `small mlx training job.sh`. Put reproducible submissions under `records/track_10min_16mb/` or `records/track_non_record_16mb/`, one folder per run, including `README.md`, `submission.json`, logs, and the exact training script used.

## Build, Test, and Development Commands

Create an environment and install dependencies with `python3 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt`.

Download baseline data with `python3 data/cached_challenge_fineweb.py --variant sp1024`.

Run the PyTorch baseline with:
```bash
RUN_ID=baseline_sp1024 \
DATA_PATH=./data/datasets/fineweb10B_sp1024/ \
TOKENIZER_PATH=./data/tokenizers/fineweb_1024_bpe.model \
VOCAB_SIZE=1024 \
torchrun --standalone --nproc_per_node=1 train_gpt.py
```

Run a fast MLX smoke test with `bash "bash_scripts/small mlx training job.sh"`.

## Coding Style & Naming Conventions

Follow existing Python style: 4-space indentation, clear section headers, and concise inline comments only where behavior is non-obvious. Keep baseline scripts readable for newcomers; both root training scripts explicitly cap themselves at 1500 lines. Prefer descriptive `snake_case` for variables, functions, and environment variables, and use dated, descriptive folder names for records such as `2026-03-23_LeakyReLU_LegalTTT_ParallelMuon`.

## Testing Guidelines

There is no dedicated `tests/` suite today. Validate changes with targeted smoke runs instead: short `ITERATIONS` overrides, the MLX helper script, or a one-GPU `torchrun` launch. For data changes, verify shard paths and tokenizer artifacts under `data/datasets/` and `data/tokenizers/`. Do not submit unrun training scripts inside `records/`.

## Commit & Pull Request Guidelines

Recent history favors short, imperative subjects such as `Update README.md`, plus descriptive submission titles that may reference the PR number. Keep commits narrowly scoped. PRs should explain the motivation, summarize metric or workflow impact, and link any relevant issue or discussion. Submission PRs must only add a new `records/...` folder and include the full artifact set required in `README.md`.
