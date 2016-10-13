# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=minishift-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Tool that makes it easy to run OpenShift locally."
url="https://github.com/jimmidyson/minishift"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('minishift')

source=(minishift_${pkgver}::https://github.com/jimmidyson/minishift/releases/download/v${pkgver}/minishift-linux-amd64)
sha256sums=('366292c28bc8103d7474db7af723e3ef8503b878f3ff51486b772d21c9097a5e')



package() {
  install -Dm755 "${srcdir}/minishift_${pkgver}" "${pkgdir}/usr/bin/minishift"
}
