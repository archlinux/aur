# Maintainer: Aethar <elliott.ashby88@gmail.com>

_pkgname=twitchmpv
pkgname="${_pkgname}-git"
pkgver=0.0.1.r3.9002501
pkgrel=1
pkgdesc="Wrapper bash script for streamlink in order to more simply watch twitch from the terminal."
arch=('any')
url="https://github.com/Aethar01/twitchmpv"
license=('BSD-2-Clause')
makedepends=('git')
depends=('streamlink' 'mpv')
provides=(twitchmpv)
source=("git+${url}.git")

package() {
    cd "${srcdir}" || exit
    cd "${_pkgname}" || exit
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
sha256sums=('SKIP')
