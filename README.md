# libwsman

OpenWSMAN 2.8.1 C and C++ client libraries, headers, pkg-config metadata, and
client configuration. This package supplies the WS-Management client used by
libvirt's Hyper-V driver.

The server, server plugins, and language bindings are disabled. In particular,
the Python bindings in this upstream release use obsolete Python APIs and fail
to build with current SWIG / Python toolchains. They are not required by libvirt.

This package conflicts with `openwsman` because the packages install the same
client libraries and headers. It does not provide the OpenWSMAN server or
language bindings.

Build and run the upstream offline tests with:

```sh
makepkg -s
```

The `test_client_*` integration tests need a configured WS-Man server and are
excluded from the package's `check()` step.
