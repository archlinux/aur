#!/usr/bin/bash

set -e

usage() {
    echo "Usage: $0 {stable|regular|rapid}" >&2
}

case $1 in
    -h)
        usage
        exit 0
        ;;
    stable)
        readonly major_version='1.13'
        ;;
    regular)
        readonly major_version='1.14'
        ;;
    rapid)
        readonly major_version='1.16'
        ;;
    *)
        usage
        exit 1
        ;;
esac

readonly pkgname=kubectl

readonly channel=$1

readonly version=$(curl -sSL "https://gcsweb.k8s.io/gcs/kubernetes-release/release/stable-$major_version.txt")

readonly arches=$( \
    curl -sSL https://gcsweb.k8s.io/gcs/kubernetes-release/release/$version/bin/linux/ \
    | rg -o --pcre2 '(?<=/icons/dir.png"> )(\w+)' \
    | sed -r "/386|amd64|arm|arm64/!d; \
              s/386/i686/; \
              s/amd64/x86_64/; \
              s/\<arm\>/armv5 armv6h armv7h/; \
              s/arm64/aarch64/" \
    | tr '\n' ' ' \
)

cat <<EOF
# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=$pkgname-gke-$channel-bin
pkgver=$version
pkgrel=1
pkgdesc='Kubernetes.io client binary, compatible with the GKE version from the $channel channel'
provides=("$pkgname=$version")
conflicts=($pkgname $pkgname-bin)
arch=($arches)
url="https://github.com/kubernetes/kubectl"
license=('Apache-2.0')

package() {
  install -Dm755 "\$srcdir/kubectl" "\$pkgdir/usr/bin/kubectl"
}

EOF

for arch in $arches; do
    case $arch in
        i686)
            _arch=386
            ;;
        x86_64)
            _arch=amd64
            ;;
        arm*)
            _arch=arm
            ;;
        aarch64)
            _arch=arm64
            ;;
        *)
            echo "Unsupported architecture: $arch" >&2
            exit 1
            ;;
    esac

    base_url="https://storage.googleapis.com/kubernetes-release/release/$version/bin/linux/$_arch"

    echo "source_$arch=('$base_url/kubectl')"
    echo "sha256sums_$arch=('$(curl -sSL $base_url/kubectl.sha256)')"
done

