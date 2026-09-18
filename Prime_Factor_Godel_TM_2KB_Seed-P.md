# Prime_Factor_Godel_TM_2KB — Seed-P (`a = P`)

Diagonal seed **`a = P = [2,3,5,7,11,13]`** with Gödel register in **`Q⁺`** (`fractions.Fraction`), so sign-flip on `a[5]` keeps `exact` replayable.

## Run

```sh
bash Prime_Factor_Godel_TM_2KB_Seed-P.sh [N]
curl -fsSL https://raw.githubusercontent.com/letsgo0226/Prime_Factor_Godel_TM_2KB.sh/main/Prime_Factor_Godel_TM_2KB_Seed-P.sh | bash
```

## Resident

- Actions: `.github/workflows/prime-factor-godel-tm-seed-p.yml` (`*/5` + events)
- Daemon: `Prime_Factor_Godel_TM_2KB_Seed-P_DAEMON.sh` (default **1s**)

## Bound

`exact`, `open=1`, `final=0`, `omega_attained=0`, `program_equals_zeta=0`. Formal diagonal TM only — not RH/TOE/physical network field.
