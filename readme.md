# unison-upstream-bin

This is unison packaged using the binaries provided from upstream.

The main differences with respect to the official unison package are that:

- unison does not incorporate the downstream patch that is provided by arch
- unison is compiled using the stable version of OCaml (4.14.x)

You may want to install this package rather than the official one in case you
encounter stability problems that may be caused by the still somehow
experimental state of the OCaml 5.x compiler used by arch.
