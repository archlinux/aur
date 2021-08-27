# Maintainer: Rohan Jain <crodjer [@] pm [dot] me>

pkgname=sysit-bin
pkgver=0.6.0
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

sha256sums_x86_64=('835f74d8d5802f73b6dededf75a52cc3a9fed665b7dfece10b46e7bf0ad7795c')
sha256sums_aarch64=('9b17e7146fcda389e4422844d77bbb01dc3540ad0fa8d99ece682ed74c6c6b2b')
sha256sums_armv7=('2c69afb59f0362587716652510250c294e361a9d4b09db0cb203ff0cd79f8fc2')

package() {
  install -Dm755 "${srcdir}/sysit" "${pkgdir}/usr/bin/sysit"
}
