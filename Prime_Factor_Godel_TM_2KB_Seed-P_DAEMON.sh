#!/usr/bin/env bash
# Seed-P exact Z/Q halt-on-cycle resident loop — default interval 1s
set -u
INTERVAL="${1:-${PFGP_INTERVAL:-1}}"
LOG="${PFGP_LOG:-prime_factor_godel_tm_seed_p_daemon.log}"
DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd || pwd)"
SCRIPT="${PFGP_SCRIPT:-$DIR/Prime_Factor_Godel_TM_2KB_Seed-P.sh}"
RAW_URL="https://raw.githubusercontent.com/letsgo0226/Prime_Factor_Godel_TM_2KB.sh/main/Prime_Factor_Godel_TM_2KB_Seed-P.sh"
if [[ ! -f "$SCRIPT" ]]; then
  command -v curl >/dev/null || exit 127
  SCRIPT="${TMPDIR:-/tmp}/Prime_Factor_Godel_TM_2KB_Seed-P.sh"
  curl -fsSL "$RAW_URL" -o "$SCRIPT" || exit 1
fi
command -v python3 >/dev/null || exit 127
echo "{\"daemon\":\"EXACT_PRIME_FACTOR_GODEL_TM_SEED_P\",\"interval\":$INTERVAL,\"halt\":\"repeated_state\",\"ts\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"}" | tee -a "$LOG"
while true; do
  TS=$(date -u +%Y-%m-%dT%H:%M:%SZ)
  OUT=$(mktemp)
  if bash "$SCRIPT" >"$OUT" 2>"${OUT}.err"; then
    if python3 - "$OUT" <<'PY'
import json,sys
o=json.load(open(sys.argv[1]))
ok=(o.get("model")=="EXACT_PRIME_FACTOR_GODEL_TM" and o.get("exact") is True
    and o.get("halted")==1 and o.get("open")==0 and o.get("final")==1
    and o.get("omega_attained")==0 and o.get("program_equals_zeta")==0
    and o.get("seed")==[2,3,5,7,11,13]
    and int(o.get("steps") or 0)==len(o.get("levels") or [])
    and "no floating point" in str(o.get("arithmetic","")))
sys.exit(0 if ok else 2)
PY
    then echo "{\"ts\":\"$TS\",\"status\":\"pass\"} $(python3 -c 'import json,sys;o=json.load(open(sys.argv[1]));print(json.dumps({k:o[k] for k in ["exact","halted","steps","open","final","repeated_state"]},separators=(",",":")))' "$OUT")" >>"$LOG"
    else echo "{\"ts\":\"$TS\",\"status\":\"assert_fail\"}" >>"$LOG"
    fi
  else echo "{\"ts\":\"$TS\",\"status\":\"run_fail\"}" >>"$LOG"
  fi
  rm -f "$OUT" "${OUT}.err"
  sleep "$INTERVAL"
done
