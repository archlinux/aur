# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=prem
pkgver=1.1.0
pkgrel=1
pkgdesc='Be reminded of daily events, such as lunch'
arch=(any)
url='https://github.com/xyproto/prem'
license=(MIT)
optdepends=('bash: bash support'
            'fish: fish support'
            'zsh: zsh support')
depends=(python)
source=("git+https://github.com/xyproto/prem#commit=5243f178787257ffaf89d67bc61924ea9394f352") # tag v1.1.0
sha256sums=('SKIP')

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/prem/LICENSE"
}

# vim: ts=2 sw=2 et:
