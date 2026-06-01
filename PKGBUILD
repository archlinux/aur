# Maintainer: Raj S. <ragef6@tutanota.de>
# https://github.com/OxiCrypt/aur

pkgname=shardy-rs-bin
_pkgname=shardy
pkgver=0.1.2
pkgrel=1
pkgdesc="The leading headless encryption tool."
arch=('x86_64' 'aarch64')
url="https://github.com/OxiCrypt/shardy"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
source_x86_64=("$_pkgname-$pkgver::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-linux")
source_aarch64=("$_pkgname-$pkgver::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-linux")
sha256sums_x86_64=("6ebc2567af8d03005e9bdfc72228c388467ce31e733be5c00bcf751c16cdc974")
sha256sums_aarch64=("0971b9d357a7183a2d3cc11c9b5a9f261c634965f21f71724ce88e15f3c3ee62")
package() {
  install -Dm 755 "$_pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
}
