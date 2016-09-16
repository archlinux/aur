# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=minishift-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Tool that makes it easy to run OpenShift locally."
url="https://github.com/jimmidyson/minishift"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('minishift')

source=(minishift_${pkgver}::https://github.com/jimmidyson/minishift/releases/download/v${pkgver}/minishift-linux-amd64)
sha256sums=('0435ea2cda9ed3ea53ade8751cd4f08436c8b4ace8b6ad26a2405777068b5d6e')


package() {
  install -Dm755 "${srcdir}/minishift_${pkgver}" "${pkgdir}/usr/bin/minishift"
}
