pkgname=yaknt
pkgver=1.0
pkgrel=1
pkgdesc='New tab for Yakuake console'
arch=(any)
url='https://github.com/logrusorgru/yaknt'
license=(GPL-3.0)

depends=(
    'python3'
)

makedepends=(
    'coreutils'
)

source=(https://github.com/logrusorgru/yaknt/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('88360713daf4e2a36852efd2a5585fac589fd4babe1af11d31b55fc63564d297')

provides=(yaknt)

package() {
  cd "yaknt-${pkgver}"
  install -Dp --mode=755 --owner=root --group=root yaknt "${pkgdir}/usr/bin/yaknt"
}
