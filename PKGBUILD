# Maintainer: Rohan Jain <crodjer [@] pm [dot] me>

pkgname=sysit-bin
pkgver=0.9.0
pkgrel=1
pkgdesc=' System Sit! Check on the system with a quick glance.'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/crodjer/sysit'
license=('GPL-3.0-or-later')
depends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('461db43c029649494331f2a4922571c1948a7aa68f52af10e4a4201f70564275')
sha256sums_aarch64=('c80c9da6a515fae9c2d7cba9ec5eb04e8ef2e1775545adabfed0957c3c73b9fe')
sha256sums_armv7=('81ef9484d689bd3396261ab25202e4a31a5ac88c82a998df801f34c96034ea61')

package() {
  install -Dm755 "${srcdir}/sysit" "${pkgdir}/usr/bin/sysit"
}
