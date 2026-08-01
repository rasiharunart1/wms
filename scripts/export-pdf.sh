#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

INPUT_FILE="${REPO_ROOT}/docs/laporan-wms-pdf-ready.md"
OUTPUT_FILE="${REPO_ROOT}/docs/laporan-wms-pdf-ready.pdf"

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Error: pandoc tidak ditemukan di PATH." >&2
  exit 1
fi

if ! command -v xelatex >/dev/null 2>&1; then
  echo "Error: xelatex tidak ditemukan di PATH." >&2
  exit 1
fi

pandoc "${INPUT_FILE}" \
  --from=gfm \
  --pdf-engine=xelatex \
  --output="${OUTPUT_FILE}" \
  --toc \
  --number-sections

echo "PDF berhasil dibuat: ${OUTPUT_FILE}"
