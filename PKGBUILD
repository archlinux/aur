# Maintainer: Vladimir Romashchenko <eaglesemanation@gmail.com>
pkgname=displayconfig-mutter-bin
_pkgname=displayconfig-mutter
pkgver=0.1.8
pkgrel=1
pkgdesc="Change Gnome display settings from cli"
arch=("x86_64" "aarch64")
url="https://github.com/eaglesemanation/${pkgname}"
license=("MIT")

source_x86_64=("displayconfig-mutter::https://github.com/eaglesemanation/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-x86_64")
source_aarch64=("displayconfig-mutter::https://github.com/eaglesemanation/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-aarch64")
sha256sums_x86_64=('ed7297ff286cb69466abd3c8146e279b021bd81947027255bed8a56083ce7eb2')
sha256sums_aarch64=('ed7297ff286cb69466abd3c8146e279b021bd81947027255bed8a56083ce7eb2')

package() {
  install -Dm755 displayconfig-mutter \
    "$pkgdir/usr/bin/displayconfig-mutter"
}
