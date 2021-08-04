#!/bin/bash

pushd /opt/docker-bench-security > /dev/null
exec /opt/docker-bench-security/docker-bench-security.sh "$@"
popd > /dev/null
