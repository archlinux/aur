# Maintainer: RaCoMed <mouhamed.kammoun at proton dot me>
# Ex-Maintainer: ValHue <vhuelamo at gmail dot com>
# Ex-Contributor: Pival81 <pival801 at gmail dot com>
pkgname="nemo-megasync"
pkgver="6.2.0"
pkgrel="1"
pkgdesc="MEGASync extension for the Nemo file browser"
arch=('x86_64')
url="https://mega.io/desktop#downloadapps"
license=('custom:The Clarified Artistic License')
depends=('hicolor-icon-theme' 'nemo' 'megasync')
provides=(nemo-megasync=${pkgver})
options=('!strip' '!debug')

source=("nemo-megasync-${pkgver}-${pkgrel}-x86_64.tar.zst::https://mega.nz/linux/repo/Arch_Extra/x86_64/nemo-megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('9ce1b0ad4dc4d89a0d878a9075c2948df4dec99bfa75c6e41cbca64f6e0595b9')

install="${pkgname}.install"

package () {
    cp -r usr $pkgdir/
}
