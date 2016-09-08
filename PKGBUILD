# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=minishift-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Tool that makes it easy to run OpenShift locally."
url="https://github.com/jimmidyson/minishift"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('minishift')

source=("https://github.com/jimmidyson/minishift/releases/download/v${pkgver}/minishift-linux-amd64")
sha256sums=('a184653f7aae8cc53af312521aa1fea1a469681849597eb1585eec63601571ab')


package() {
  install -Dm755 "${srcdir}/minishift-linux-amd64" "${pkgdir}/usr/bin/minishift"
}
