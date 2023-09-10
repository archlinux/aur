# Maintainer: Namkhai B. <echo em.roekn@kn | rev>

_pkgname=rres
pkgname=${_pkgname}-bin
pkgver=0.1.5
pkgrel=0
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('x86_64')
url="https://sr.ht/~nkeor/rres"
license=('GPLv3')
provides=('rres')
conflicts=('rres')
source_x86_64=("https://git.sr.ht/~nkeor/${_pkgname}/refs/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch}-unknown-linux-musl")
sha256sums_x86_64=('e66d3a63dff6f4d6d7a2fa28271b7c1f76251c2e12185faab13ee50c3f692ce3')

package() {
    install -Dm755 "${_pkgname}-v${pkgver}-${arch}-unknown-linux-musl" \
        "${pkgdir}/usr/bin/rres"
}
