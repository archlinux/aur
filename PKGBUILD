# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=minishift-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Tool that makes it easy to run OpenShift locally."
url="https://github.com/jimmidyson/minishift"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('minishift')

source=("https://github.com/jimmidyson/minishift/releases/download/v${pkgver}/minishift-linux-amd64")
sha256sums=('09cd31aaec97c438aee787a94a2487ea4c2e4ed7c3a319088b8bd85d3101a341')


package() {
  install -Dm755 "${srcdir}/minishift-linux-amd64" "${pkgdir}/usr/bin/minishift"
}
