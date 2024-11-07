go install github.com/bazelbuild/buildtools/buildifier@latest
$(go env GOPATH)/bin/buildifier --mode=diff --diff_command="diff -u" -r .
