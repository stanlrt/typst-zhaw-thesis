[private]
default:
  @just --list --unsorted

# check that version numbers agree across the package
check *tag:
  ./scripts/check {{tag}}

# compile the template as a user would get it
test:
  bash -c '. scripts/common && compile_template .build/template.pdf && echo "template compiles"'

# generate thumbnail.png and showcase.pdf
assets:
  ./scripts/assets

# copy the package into a directory, or @local / @preview to install it locally
package target: assets
  ./scripts/package "{{target}}"
