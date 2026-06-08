# Maintainer: Raj S. <ragef6@tutanota.de>
# https://github.com/OxiCrypt/aur

pkgname=shardy-rs-bin
_pkgname=shardy
pkgver=0.1.5
pkgrel=1
pkgdesc="The leading headless encryption tool."
arch=('x86_64' 'aarch64')
url="https://github.com/OxiCrypt/shardy"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
source_x86_64=("$url/releases/download/v${pkgver}/${_pkgname}-x86_64-linux")
source_aarch64=("$url/releases/download/v${pkgver}/${_pkgname}-aarch64-linux")
sha256sums_x86_64=('eaa93f98ff71981a49371a3a7642a1a34e1c8119a7750e3ee3ac038298c2657c')
sha256sums_aarch64=('6bf19cfbb5ed504f3460f2c987ab30b3fe4d222fccd77070c4ce63842cb4299b')
package() {
  install -Dm 755 "$_pkgname-$CARCH-linux" "${pkgdir}/usr/bin/$_pkgname"
}
