# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sealion
pkgver=2.0.1
pkgrel=2
pkgdesc='Prompt lunch reminder (for bash, fish and zsh)'
arch=(any)
url='https://github.com/xyproto/sealion'
license=(MIT)
depends=(python)
optdepends=('bash: bash support'
            'fish: fish support'
            'zsh: zsh support')
source=("git+$url#commit=4491fe57ab795c0b6cebf39d01d00cd63e917508") # tag: v2.0.1
b2sums=(SKIP)

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/sealion/LICENSE"
}
