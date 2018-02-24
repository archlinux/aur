# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=qservicemenuconfig
pkgver=0.1.1
pkgrel=1
pkgdesc="MenuEditor for Dolphin"
arch=('x86_64')
url="https://www.opendesktop.org/s/Apps/p/1215612/"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base')
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1519370411/s/ddcd25b32aaeb98c2a169972934e0fff/t/1519489318/u//QServiceMenuConfig-$pkgver.tgz")
sha256sums=('9ee21ff5207eca7d756944efed1d8d5dec9fe083a201671a44d143eaf037d1d8')

build() {
  cd "QServiceMenuConfig-$pkgver"
  qmake-qt5
  make
}

package() {
  make -C "QServiceMenuConfig-$pkgver" DESTDIR="$pkgdir" install
}
