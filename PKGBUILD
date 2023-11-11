# Maintainer: Rohan Jain <crodjer [@] pm [dot] me>

pkgname=sysit-bin
pkgver=0.9.2
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

sha256sums_x86_64=('8e05f1b50bc1f3157c9962859bd383cbb222643f088a2b71d8e316f2ac3be41e')
sha256sums_aarch64=('7bd354bce3fbda9121e9d2fe85da52ac68dfb19b45032bfefe646925f5eda519')
sha256sums_armv7=('8145da8356f8ee85f1f240d0215911cbf170d7a3de02a07c7b12645db7d42ee4')

package() {
  install -Dm755 "${srcdir}/sysit" "${pkgdir}/usr/bin/sysit"
}
