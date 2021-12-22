# Maintainer: Rohan Jain <crodjer [@] pm [dot] me>

pkgname=sysit-bin
pkgver=0.8.1
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

sha256sums_x86_64=('f59c7bf986f6e4887eb44752d23e83c83877a5e933cdb1053c06905df561a2fd')
sha256sums_aarch64=('cba4425b3c0a5167f0cabdbd145cb5e495c7b9fcee27a6a01694996b783fc68a')
sha256sums_armv7=('683719358700e5c4fe710dfee11875853485191459336dd19166791042cd4ca9')

package() {
  install -Dm755 "${srcdir}/sysit" "${pkgdir}/usr/bin/sysit"
}
