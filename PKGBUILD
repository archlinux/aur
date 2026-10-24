# Contributor: Gerald Wu <gerald at geraldwu dot com>
# Maintainer: tee < teeaur at duck dot com >
# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=dapr-cli-bin
pkgver=1.19.1
pkgrel=1
pkgdesc='Command-line tools for Dapr'
arch=('x86_64' 'aarch64')
url='https://github.com/dapr/cli'
license=('Apache-2.0')
options=('!strip' '!emptydirs')
provides=('dapr')

source_x86_64=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz")
source_aarch64=("dapr-cli-$pkgver-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_arm64.tar.gz")

sha256sums_x86_64=('6e9a339d261e430e5914909cc4443572573c197c174c3e14504c34116831de3b')
sha256sums_aarch64=('b28bfa9a6aa6748e082bfcf97534fef68cae32a05f19c0b5c0dba8a70182a3d7')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}