# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=ttf-proggy-clean
pkgver=1.1.5
pkgrel=2
pkgdesc='Monospaced fonts for programming'
arch=(any)
url='https://github.com/bluescan/proggyfonts/'
license=(MIT)
makedepends=(git)
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  for f in proggyfonts/ProggyOriginal/*.ttf; do
    install -Dm644 "$f" "$pkgdir/usr/share/fonts/TTF/$(basename $f)"
  done
  install -Dm644 proggyfonts/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:

