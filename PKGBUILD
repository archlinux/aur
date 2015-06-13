# Maintainer: bzt <unmacaque at gmail.com>
# Contributor: bzt <unmacaque at gmail.com>

pkgname=ubuntu-sounds
pkgver=0.13
pkgrel=3
pkgdesc="Ubuntu's GNOME audio theme"
arch=('any')
url="https://launchpad.net/ubuntu/+source/ubuntu-sounds"
license=('Creative Commons Attribution Share-Alike')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.tar.gz")
md5sums=('b5eb40f5a675f8b21e40638bb242ec4f')

package() {
  mkdir -p ${pkgdir}/usr/share/sounds/
  
  cp -r ${srcdir}/${pkgname}-${pkgver}/ubuntu ${pkgdir}/usr/share/sounds/
}


