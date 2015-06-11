# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-numix
pkgver=0.9.1
pkgrel=1
pkgdesc="An X-cursor-theme for use along with the numixproject products."
arch=('any')
url="http://gnome-look.org/content/show.php/Numix-Cursor?content=169299"
license=('GPL')
depends=('libxcursor')
source=("${pkgname}-${pkgver}.tar.gz::http://gnome-look.org/CONTENT/content-files/169299-numix-cursor.tar.gz")
md5sums=('b15c1880992292b557890669bcfdb19b')


package() {
  cd theme
  find Numix-Cursor/ -type f -not -name "*~" \
      -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find Numix-Cursor/ -type l \
      -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 et:

