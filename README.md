# Prime_Factor_Godel_TM_2KB.sh

Six-prime Gödel TM one-liners (`P=(2,3,5,7,11,13)`).

| File | Seed `a` | Register |
|------|----------|----------|
| `Prime_Factor_Godel_TM_2KB.sh` | `[0,0,1,0,1,1]` | `ℕ` |
| `Prime_Factor_Godel_TM_2KB_Seed-222111.sh` | `[2,2,2,1,1,1]` | `ℕ` |
| `Prime_Factor_Godel_TM_2KB_Seed-P.sh` | **`[2,3,5,7,11,13]` (=`P`)** | **`Q⁺`** |

```sh
curl -fsSL https://raw.githubusercontent.com/letsgo0226/Prime_Factor_Godel_TM_2KB.sh/main/Prime_Factor_Godel_TM_2KB_Seed-P.sh | bash
```

Daemon: `Prime_Factor_Godel_TM_2KB_Seed-P_DAEMON.sh` (default 1s).  
Actions: `.github/workflows/prime-factor-godel-tm-seed-p.yml` (`*/5`).

Bound: formal only (`open=1`, `omega_attained=0`) — not RH/TOE/physical field.
