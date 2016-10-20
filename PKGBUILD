# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=minishift-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Tool that makes it easy to run OpenShift locally."
url="https://github.com/jimmidyson/minishift"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('minishift')

source=(minishift_${pkgver}::https://github.com/jimmidyson/minishift/releases/download/v${pkgver}/minishift-linux-amd64)
sha256sums=('8a997b5083fa748dd3b2d7ce9cf3d19ac623385c352c87a091508e7cfe7e6126')



package() {
  install -Dm755 "${srcdir}/minishift_${pkgver}" "${pkgdir}/usr/bin/minishift"
}
