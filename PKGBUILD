# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=eggs
pkgver=7.6.79
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
source=("${pkgname}-${pkgver}.deb::https://sourceforge.net/projects/penguins-eggs/files/packages-deb/eggs_${pkgver}-1_amd64.deb/download")
sha256sums=('80775c3e4ab2fe9836646e4f18f6676d6b76dfa74e0f1fc67f78617a077816d8')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
