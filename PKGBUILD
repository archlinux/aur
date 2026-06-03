# Maintainer: Raj S. <ragef6@tutanota.de>
# https://github.com/OxiCrypt/aur

pkgname=shardy-rs-bin
_pkgname=shardy
pkgver=0.1.4
pkgrel=1
pkgdesc="The leading headless encryption tool."
arch=('x86_64' 'aarch64')
url="https://github.com/OxiCrypt/shardy"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
source_x86_64=("$url/releases/download/v${pkgver}/${_pkgname}-x86_64-linux")
source_aarch64=("$url/releases/download/v${pkgver}/${_pkgname}-aarch64-linux")
sha256sums_x86_64=('58cfb24619046e202c293f9b20b985b3d4c36ef3fb8b5d76dd8a1c78567be1a9')
sha256sums_aarch64=('da324f21926829bbf02c7c3300ebd9bc765d31f3c3a594e41f6e3809bd2acfec')
package() {
  install -Dm 755 "$_pkgname-$CARCH-linux" "${pkgdir}/usr/bin/$_pkgname"
}
