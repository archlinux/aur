# Maintainer: Vladimir Romashchenko <eaglesemanation@gmail.com>
pkgname=displayconfig-mutter-bin
_pkgname=displayconfig-mutter
pkgver=0.1.10
pkgrel=1
pkgdesc="Change Gnome display settings from cli"
arch=("x86_64" "aarch64")
url="https://github.com/eaglesemanation/${pkgname}"
license=("MIT")

source_x86_64=("displayconfig-mutter::https://github.com/eaglesemanation/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-x86_64")
source_aarch64=("displayconfig-mutter::https://github.com/eaglesemanation/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-aarch64")
sha256sums_x86_64=('83936c4edfd8eda990002ffc5693e58dc27141753b7ceb5040824a685407bcb4')
sha256sums_aarch64=('83936c4edfd8eda990002ffc5693e58dc27141753b7ceb5040824a685407bcb4')

package() {
  install -Dm755 displayconfig-mutter \
    "$pkgdir/usr/bin/displayconfig-mutter"
}
