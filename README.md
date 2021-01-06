# OcamlFormat

This is a fork of the original ocamlformat repo to allow building with `js_of_ocaml`.

To build the js: `dune build js/main.bc.js --profile=release`. The build executable will
be in `_build/default/js/main.bc.js`. It exports an object `Ocamlformat` with a single method
`format` which takes and returns js strings.
