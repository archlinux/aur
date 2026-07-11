# Maintainer: Vladimir Romashchenko <eaglesemanation@gmail.com>
pkgname=displayconfig-mutter-bin
_pkgname=displayconfig-mutter
pkgver=0.1.9
pkgrel=1
pkgdesc="Change Gnome display settings from cli"
arch=("x86_64" "aarch64")
url="https://github.com/eaglesemanation/${pkgname}"
license=("MIT")

source_x86_64=("displayconfig-mutter::https://github.com/eaglesemanation/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-x86_64")
source_aarch64=("displayconfig-mutter::https://github.com/eaglesemanation/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-aarch64")
sha256sums_x86_64=('c235f86d0a9b37448ae7ca3c53d5a8082afe7e022dd313bb0507c5e4221f3b32')
sha256sums_aarch64=('c235f86d0a9b37448ae7ca3c53d5a8082afe7e022dd313bb0507c5e4221f3b32')

package() {
  install -Dm755 displayconfig-mutter \
    "$pkgdir/usr/bin/displayconfig-mutter"
}
