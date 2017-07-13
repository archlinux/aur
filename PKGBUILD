# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-bmz
pkgver=1.8
pkgrel=3
pkgdesc="Mouse cursor for X11 desktop. Inspiration was drawn from various sources, including DMZ and Breeze, but design manages to be quite unique."
arch=('any')
url="https://www.gnome-look.org/p/1158321/"
license=('GPL')
depends=('libxcursor')
#source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1493318153/BMZ.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('6bc80f6681446a58a4aeec1d920ee78948a8d9477cb1bc84d64403f8d9338f61')



package() {
  find BMZ/ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find BMZ/ -type l -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 et:

