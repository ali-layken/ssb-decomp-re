#!/usr/bin/env bash
set -euo pipefail

SEG="ovl8_13"
FUNC="func_ovl8_8037D8CC"

# Run livediff and tee output to a stable file path
./livediff.sh "$SEG" "$FUNC" | tee "agent/agent_livediff_${SEG}_${FUNC}.txt"

echo
echo "WROTE: build/agent_livediff_${SEG}_${FUNC}.txt"
