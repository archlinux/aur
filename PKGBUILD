# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sealion
pkgver=2.0.1
pkgrel=1
pkgdesc='Be reminded of daily events, such as lunch'
arch=(any)
url='https://github.com/xyproto/sealion'
license=(MIT)
depends=(python)
optdepends=('bash: bash support'
            'fish: fish support'
            'zsh: zsh support')
source=("git+$url#commit=4491fe57ab795c0b6cebf39d01d00cd63e917508") # tag: v2.0.1
sha256sums=(SKIP)

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sealion/LICENSE"
}

# vim: ts=2 sw=2 et:
