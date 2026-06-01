# Maintainer: Raj S. <ragef6@tutanota.de>
# https://github.com/OxiCrypt/aur

pkgname=shardy-rs-bin
_pkgname=shardy
pkgver=0.1.3
pkgrel=1
pkgdesc="The leading headless encryption tool."
arch=('x86_64' 'aarch64')
url="https://github.com/OxiCrypt/shardy"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
source_x86_64=("$_pkgname-$pkgver::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-linux")
source_aarch64=("$_pkgname-$pkgver::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-linux")
sha256sums_x86_64=('bfbd1ee22e1fa4f1d14ca6c6698e1588696350683a55802eccc923dce061d16d')
sha256sums_aarch64=('8bfc2995887ffa8fb63114e0c6186e3411a8a3f0b54fafba83b134b985cf2bb7')
package() {
  install -Dm 755 "$_pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
}
