# kubectx-bash

As of 2023-10-23, Arch Linux moved `kubectx` packaging from the bash version to the Go version. Unfortunately, the Go version of `kubectx` is still missing a variety of features.

Most notably, it is missing the ability to [work with multiple kubeconfig files](https://github.com/ahmetb/kubectx/issues/211) and [resolving file paths relative to config file](https://github.com/ahmetb/kubectx/issues/229).

This repo repackages the bash version of `kubectx` the Go version reaches feature parity with the bash version.
