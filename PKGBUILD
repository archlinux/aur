# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=minishift-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="Tool that makes it easy to run OpenShift locally."
url="https://github.com/jimmidyson/minishift"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('minishift')

source=("https://github.com/jimmidyson/minishift/releases/download/v${pkgver}/minishift-linux-amd64")
sha256sums=('98d35e1817226c6b238746c64d837d51fd3bac447def6d035306e1f29ffcb424')


package() {
  install -Dm755 "${srcdir}/minishift-linux-amd64" "${pkgdir}/usr/bin/minishift"
}
