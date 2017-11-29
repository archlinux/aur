# Maintainer: Kevin McCormack <harlemsquirrel@gmail.com>
pkgname=cura2-lulzbot
pkgver=2.6.52
pkgrel=1
pkgdesc='This is the development version of Cura 2 for LulzBot 3D Printers by Aleph Objects, Inc.'
arch=('x86_64')
url='https://code.alephobjects.com'
license=('AGPLv3')
source=("http://download.alephobjects.com/ao/aodeb/dists/stretch/main/binary-amd64/cura-lulzbot_${pkgver}_amd64.deb")
md5sums=('2aa34eb60d5a4d536c4fa16ee7100347')

prepare() {
  # Unpack the tarball containing the 'usr/' directory,
  # where all the essentials reside within the debian package
  tar zxf "${srcdir}/data.tar".gz -C "${srcdir}"
}

package() {
  cp -r "${srcdir}"/usr "${pkgdir}"/usr
}
