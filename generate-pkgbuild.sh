#!/usr/bin/bash

set -euo pipefail

usage() {
    echo "Usage: $0 [{stable|regular|rapid}]" >&2
}

get_channel() {
  echo ${PWD##*/} | grep -Eo '\-(stable|regular|rapid)-' | tr -d '\-'
}

get_major_version() {
    curl https://cloud.google.com/feeds/gke-stable-channel-release-notes.xml \
        | sed 's/xmlns=".*"//g' \
        | xmllint --nocdata --xpath '(/feed/entry)[1]/content/text()' - \
        | rg -o 'v?(\d\.\d+)\.\d+-gke\.\d+' -r '$1' \
        | head -n 1
}

if [[ $# -eq 0 ]];
then
  readonly channel=$(get_channel)
  echo "Channel is not specified, automatically detected: $channel" >&2
  read -p "Is it correct? y/n " yn
  case $yn in
    [Yy]* ) set -- "$channel" ;;
    * ) usage; exit 0;;
  esac
else
  readonly channel=$1
fi

case $1 in
    -h)
        usage
        exit 0
        ;;
    stable | regular | rapid)
        readonly major_version=$(get_major_version $1)
        ;;
    *)
        usage
        exit 1
        ;;
esac


readonly pkgname=kubectl

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
  install -Dm755 "\$srcdir/$pkgname-$version" "\$pkgdir/usr/bin/kubectl"
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

    echo "source_$arch=('$pkgname-$version::$base_url/kubectl')"
    echo "sha256sums_$arch=('$(curl -sSL $base_url/kubectl.sha256)')"
done

