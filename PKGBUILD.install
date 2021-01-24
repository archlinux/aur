# Maintainer: Andrew Sichevoi (thekondor.net)

pkgname=reset-trackpoint-fix
pkgver=0.0.1
pkgrel=1
pkgdesc="Tiny w/a for Lenovo Thinkpad's trackpoint/trackpad which deads on a laptop resume."
arch=('x86_64')
url="https://github.com/thekondor/${pkgname}"
license=('MPL')
makedepends=(
  'make'
  'systemd'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thekondor/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('12e3f89854f9ada6b5d1a055e76c12765ee6eb02735e8b8e84359845d049df7e')
install='PKGBUILD.install'

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR=${pkgdir} make install
}

