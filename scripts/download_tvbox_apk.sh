#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUT_DIR="$ROOT_DIR/downloads"

mkdir -p "$OUT_DIR"

if ! command -v jq >/dev/null 2>&1; then
  echo "[ERROR] jq is required"
  exit 1
fi

API_CANDIDATES=(
  "https://api.github.com/repos/o0HalfLife0o/TVBoxOSC/releases/latest"
  "https://gh.llkk.cc/https://api.github.com/repos/o0HalfLife0o/TVBoxOSC/releases/latest"
  "https://mirror.ghproxy.com/https://api.github.com/repos/o0HalfLife0o/TVBoxOSC/releases/latest"
)

json=""
for api in "${API_CANDIDATES[@]}"; do
  if json_tmp="$(curl -fsSL "$api" 2>/dev/null)"; then
    if [ -n "$json_tmp" ] && [ "$json_tmp" != "null" ]; then
      json="$json_tmp"
      break
    fi
  fi
done

if [ -z "$json" ]; then
  echo "[ERROR] failed to fetch latest release metadata (network/proxy blocked)"
  exit 2
fi

apk_url="$(printf '%s' "$json" | jq -r '.assets[] | select(.name | test("\\.apk$")) | .browser_download_url' | head -n 1)"
apk_name="$(printf '%s' "$json" | jq -r '.assets[] | select(.name | test("\\.apk$")) | .name' | head -n 1)"

if [ -z "$apk_url" ] || [ "$apk_url" = "null" ]; then
  echo "[ERROR] No APK asset found in latest release"
  exit 1
fi

DL_CANDIDATES=(
  "$apk_url"
  "https://gh.llkk.cc/$apk_url"
  "https://mirror.ghproxy.com/$apk_url"
)

ok=0
for u in "${DL_CANDIDATES[@]}"; do
  if curl -fL "$u" -o "$OUT_DIR/$apk_name"; then
    ok=1
    break
  fi
done

if [ "$ok" -ne 1 ]; then
  echo "[ERROR] failed to download APK (network/proxy blocked)"
  exit 3
fi

echo "[OK] Downloaded: $OUT_DIR/$apk_name"
