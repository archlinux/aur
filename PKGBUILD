pkgname=yaknt
pkgver=1.1
pkgrel=1
pkgdesc='New tab for Yakuake console'
arch=(any)
url='https://github.com/logrusorgru/yaknt'
license=(Unlicense)

depends=(
    'python3'
)

makedepends=(
    'coreutils'
)

source=(https://github.com/logrusorgru/yaknt/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('05ed06903506ad158f139295d5e327d19e3fa591a342637f3efdbfabffbfa463')

provides=(yaknt)

package() {
  cd "yaknt-${pkgver}"
  install -Dp --mode=755 --owner=root --group=root yaknt "${pkgdir}/usr/bin/yaknt"
}
