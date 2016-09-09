# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=minishift-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Tool that makes it easy to run OpenShift locally."
url="https://github.com/jimmidyson/minishift"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('minishift')

source=(minishift_${pkgver}::https://github.com/jimmidyson/minishift/releases/download/v${pkgver}/minishift-linux-amd64)
sha256sums=('784cefddc622a9dc10482404266e2fee65d57ad2433dc2d27d744a4f1b944761')


package() {
  install -Dm755 "${srcdir}/minishift_${pkgver}" "${pkgdir}/usr/bin/minishift"
}
