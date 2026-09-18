# Prime_Factor_Godel_TM_2KB — Seed-P (`a = P`, exact ℤ/ℚ, halt on cycle)

Diagonal seed **`a = P`**. **`G ∈ Q⁺`**. Drivers exact ℤ/ℚ (**no float**).

**Halt:** `H(a)` = state already seen → stop. Emits `halted=1`, `steps`, `repeated_state`.

**Flags:** `open=0`, `final=1`, `omega="eventual cycle"`, `omega_attained=0` (finite cycle ≠ ω).

## Run

```sh
bash Prime_Factor_Godel_TM_2KB_Seed-P.sh
curl -fsSL https://raw.githubusercontent.com/letsgo0226/Prime_Factor_Godel_TM_2KB.sh/main/Prime_Factor_Godel_TM_2KB_Seed-P.sh | bash
```

No `N` argument — runs until state repeats.

## Bound

Formal exact cycle certificate only — not RH/TOE/physical field. `final=1` means this TM halted on a repeated state, not empirical closure.
