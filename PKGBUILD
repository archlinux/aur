# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-breeze
pkgver=20150109
pkgrel=1
pkgdesc="Breeze standart cursor theme (KDE Plasma 2)"
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
depends=('libxcursor')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::https://share.kde.org/public.php?service=files&t=1525897da49fbebacc28e5b6b1836382&download")
md5sums=('edbd19776aa3cbc4c0241fa1728c023f')

package() {
  find Breeze/ -type f -not -name "*~" \
      -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find Breeze/ -type l \
      -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}
