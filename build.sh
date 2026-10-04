#!/usr/bin/env bash
set -euo pipefail
rm -rf dist
mkdir -p dist
cat chunks/part-* > /tmp/movetogether-v4.b64
base64 -d /tmp/movetogether-v4.b64 > /tmp/movetogether-v4.tgz
tar -xzf /tmp/movetogether-v4.tgz -C dist
rm -rf dist/.vercel
printf 'MoveTogether v4 built: '
find dist -maxdepth 1 -type f -printf '%f ' || true
printf '\n'
