## Test environments

- ubuntu 14.04, R 3.2.5
- win-builder (devel and release)

## R CMD check results
There were no ERRORs, WARNINGs.

There was 1 NOTE, found only when using win-builder with 3.2.3:

* checking package dependencies ... NOTE
  No repository set, so cyclic dependency check skipped
  
  As I could not replicate this issue locally, and it occurs only in
  release, not devel, I assume that it is an issue with win-builder.

## Downstream dependencies
There are currently no downstream dependencies for this package