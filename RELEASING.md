# Releasing

GitHub Actions builds the generated TypeScript, Go, Rust, and Python bindings,
checks that they match the committed source, tests the npm schema exports, and
runs the Rust integration tests. Jest enforces coverage; `npm run coverage:bump`
uses jest-it-up after `npm test` to raise thresholds.

After successful master CI, release-please opens a release PR for `fix:` and
`feat:` commits. Merge the release PR to create the bare version tag, regenerate
and test that version, upload the language bindings to the GitHub release, and
publish to npm and crates.io. Release PRs receive an explicitly dispatched CI
matrix because GitHub's built-in token does not trigger PR workflows.

When changing `src/schema.json`, run `npm run build` and commit the resulting
bindings with the schema. Release-please also updates Cargo.toml's version.
Cargo tests refresh the crate's own version in Cargo.lock before publication.
The migration baseline is the existing 1.8.0 release.

## One-time setup

- Create the `release` environment restricted to the master branch.
- Allow GitHub Actions to create and approve PRs; require the CI test matrix
  instead of CircleCI checks, preserving the other branch protections.
- Configure npm trusted publishing for `@json-schema-tools/meta-schema`, owner
  `json-schema-tools`, repo `meta-schema`, workflow `release.yml`, environment
  `release`, allowing direct npm publish.
- Configure crates.io trusted publishing for the existing `json_schema` crate
  with the same repository, workflow, and environment.
- Set the environment variable `AWS_RELEASE_ROLE_ARN` to an IAM role trusting
  GitHub OIDC for `repo:json-schema-tools/meta-schema:environment:release`.
  Permit only writing `s3://meta.json-schema.tools/latest.json` and creating
  invalidations for distribution `E205UL06VEMZBZ`.

The workflow deploys the source schema to the existing S3 location and
invalidates the existing CloudFront distribution after publication. All three
services use short-lived credentials; no npm, crates.io, or AWS key is stored
in GitHub. Node 22 and npm 11 supply npm trusted publishing support.
Disable the legacy CircleCI project after merging.

## Shared workflows

CI and release execution is maintained in [foundation](https://github.com/json-schema-tools/foundation). Entry points pin a reviewed foundation commit; update both workflow pins together to adopt changes. Package scripts, coverage baselines and release-please metadata stay here. Trusted publishing continues to use this repository’s `release.yml` and `release` environment.
