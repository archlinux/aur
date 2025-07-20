# Maintainer: Vladimir Romashchenko <eaglesemanation@gmail.com>
pkgname=displayconfig-mutter-bin
_pkgname=displayconfig-mutter
pkgver=0.1.5
pkgrel=1
pkgdesc="Change Gnome display settings from cli"
arch=("x86_64" "aarch64")
url="https://github.com/eaglesemanation/${pkgname}"
license=("MIT")

source_x86_64=("displayconfig-mutter::https://github.com/eaglesemanation/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-x86_64")
source_aarch64=("displayconfig-mutter::https://github.com/eaglesemanation/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-aarch64")
sha256sums_x86_64=('e38739faaad4255400be77b07e9a40108d8d7a56abebb4b55a50dc3e429c6959')
sha256sums_aarch64=('e38739faaad4255400be77b07e9a40108d8d7a56abebb4b55a50dc3e429c6959')

package() {
  install -Dm755 displayconfig-mutter \
    "$pkgdir/usr/bin/displayconfig-mutter"
}
