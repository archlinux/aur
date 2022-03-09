# Maintainer: osiixy <osiixy at gmail dot com>

pkgname=eggs
pkgver=9.0.34
pkgrel=1
pkgdesc="A terminal utility, in active development, which allows you to remaster your system and redistribute it as an ISO image, on a USB stick or through the network via PXE remote boot"
arch=('x86_64')
url='https://penguins-eggs.net'
license=('GPL2')
depends=('python'
         'xdg-utils'
         'nodejs')
options=('!strip')
makedepends=('tar')
source=("${pkgname}_${pkgver}-1_amd64.deb::https://sourceforge.net/projects/penguins-eggs/files/packages-deb/eggs_${pkgver}-1_amd64.deb/download")
sha1sums=('930f4742c09e8b7ec9cf1787310488695812de14')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
