MkDocs rendering
================

To render a preview using [MkDocs](https://www.mkdocs.org/), install MkDocs, and run `mkdocs serve` in this directory (this requires mkdocs to be installed)

To generate a static site as tar.gz file using MkDocs, see `static_build/build_book.sh` (requires docker)

### Note!

mkdocs assumes a directory structure: we approximate this using symlinks, which is hacky but hard to avoid
