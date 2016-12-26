# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-bmz
pkgver=1.8
pkgrel=1
pkgdesc="Mouse cursor for X11 desktop. Inspiration was drawn from various sources, including DMZ and Breeze, but design manages to be quite unique."
arch=('any')
url="https://www.gnome-look.org/p/1158321/"
license=('GPL')
depends=('libxcursor')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1482749405/BMZ.tar.gz")
sha1sums=('aa5f8cecb4c2840885e23f4db70677ac864746b4')



package() {
  find BMZ/ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find BMZ/ -type l -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 et:

