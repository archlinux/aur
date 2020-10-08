# Maintainer: madhogs <madhogs at protonmail dot com>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-numix
pkgver=0.9.1
pkgrel=3
pkgdesc="An X-cursor-theme for use along with the numixproject products."
arch=('any')
url="https://www.gnome-look.org/p/999876/"
license=('GPL')
depends=('libxcursor')
source=("https://github.com/uloco/numix-cursor/archive/master.tar.gz")
sha256sums=('65b4b1fdde0bdc6c1e51a9b5417d2dc9354c3ceb988e0840a103c0ae4a90fb11')

package() {
  cd theme
  find Numix-Cursor/ -type f -not -name "*~" \
      -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find Numix-Cursor/ -type l \
      -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

