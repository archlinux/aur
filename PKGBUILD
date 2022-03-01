# Maintainer: Rohan Jain <crodjer [@] pm [dot] me>

pkgname=sysit-bin
pkgver=0.8.2
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

sha256sums_x86_64=('770e57cb5f43a857f3efea42d66db90bf0c530b9b33acebb5f8d6f4b9b8af4c9')
sha256sums_aarch64=('5be7fdcd6173cea38c63d39d5773ebea8dd92385a0f998d7a7eb254b8141b27d')
sha256sums_armv7=('0a49133ba3b5887ac4d12f71171614dcf8d072db4f2af7deb06b539ee3e3d831')

package() {
  install -Dm755 "${srcdir}/sysit" "${pkgdir}/usr/bin/sysit"
}
