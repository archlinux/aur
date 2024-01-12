# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>
_pkgname=fluentui-system-icons
pkgname="ttf-${_pkgname}"
pkgver=1.1.223
pkgrel=2
pkgdesc="A collection of familiar, friendly and modern icons from Microsoft."
arch=("any")
conflicts=("${pkgname}")
url="https://aka.ms/fluentui-system-icons"
_ghurl="https://github.com/microsoft/fluentui-system-icons"
license=('MIT')
makedepends=(
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=${pkgver}"
)
sha256sums=('SKIP')
package() {
    install -Dm644 "${srcdir}/${pkgname}.git/fonts/"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}