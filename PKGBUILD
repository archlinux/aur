# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-numix
pkgver=0.9.1
pkgrel=2
pkgdesc="An X-cursor-theme for use along with the numixproject products."
arch=('any')
url="https://www.gnome-look.org/p/999876/"
license=('GPL')
depends=('libxcursor')
source=("${pkgname}-${pkgver}.tar.gz::https://www.ppload.com/api/files/download?id=1460735152")
md5sums=('b15c1880992292b557890669bcfdb19b')


package() {
  cd theme
  find Numix-Cursor/ -type f -not -name "*~" \
      -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find Numix-Cursor/ -type l \
      -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 et:

