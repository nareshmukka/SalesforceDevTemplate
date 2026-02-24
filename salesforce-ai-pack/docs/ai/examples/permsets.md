# Permission Set and PSG Examples

## Permission Set Naming

- `PS_FT_Admin`
- `PS_FT_Trainer`
- `PS_FT_ReadOnly`

## PSG Composition Example

- `PSG_FT_Trainer` includes:
  - `PS_FT_Trainer`
  - `PS_FT_ReadOnly`
- Optional muting permission set to remove sensitive permissions for specific cohorts.

## Policy Notes

- Prefer permission sets over profile-specific grants.
- Keep PSG bundles aligned to business roles, not org chart exceptions.
