# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=minishift-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Tool that makes it easy to run OpenShift locally."
url="https://github.com/jimmidyson/minishift"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('minishift')

source=(minishift_${pkgver}::https://github.com/jimmidyson/minishift/releases/download/v${pkgver}/minishift-linux-amd64)
sha256sums=('efdd83b6041a97b3f63653f295dba78347c17afaef1ac397c77e16204bdb73a2')


package() {
  install -Dm755 "${srcdir}/minishift_${pkgver}" "${pkgdir}/usr/bin/minishift"
}
