# Deployment Examples

## Validate a Manifest in Target Org

```bash
sf project deploy start \
  --manifest manifest/package.xml \
  --target-org UAT \
  --check-only \
  --test-level RunLocalTests \
  --wait 60
```

## Quick Deploy After Validation

```bash
sf project deploy quick --job-id 0AfXXXXXXXXXXXX --target-org PROD
```

## Destructive Change Sequence Example

1. Backup metadata + confirm rollback artifact.
2. Validate additive deployment first.
3. Run approved destructive deployment in separate change set/manifest.
4. Execute post-deploy smoke tests.
