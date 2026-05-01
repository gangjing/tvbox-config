#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SRC_DIR="$ROOT_DIR/.tmp/TVBoxOSC"
OUT_DIR="$ROOT_DIR/build-output"

mkdir -p "$ROOT_DIR/.tmp" "$OUT_DIR"

if [ ! -d "$SRC_DIR/.git" ]; then
  git clone https://github.com/o0HalfLife0o/TVBoxOSC.git "$SRC_DIR"
else
  git -C "$SRC_DIR" fetch --all --tags
  git -C "$SRC_DIR" pull --ff-only
fi

cd "$SRC_DIR"

if [ -x "./gradlew" ]; then
  ./gradlew assembleRelease
else
  echo "[ERROR] gradlew not found"
  exit 1
fi

find "$SRC_DIR" -type f -name "*release*.apk" -print -exec cp -f {} "$OUT_DIR" \;

echo "[OK] Build finished. APK output in: $OUT_DIR"
