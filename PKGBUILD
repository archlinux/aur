# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

_pkgname=rres
pkgname=${_pkgname}-bin
pkgver=0.1.4
pkgrel=0
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('x86_64')
url="https://sr.ht/~f9/rres"
license=('GPLv3')
provides=('rres')
conflicts=('rres')
source_x86_64=("https://git.sr.ht/~f9/${_pkgname}/refs/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch}-unknown-linux-musl")
sha256sums_x86_64=('c5b7124e5a515a0b0c22a822ea1312b6aee2627b2917c2ec34b299fae04c1ede')
b2sums_x86_64=('990889c2997ad729062574ae3ebc2f51ddd137a25213d21f95997ab5e34aa4ff12236fd549510b91c99449783c064920e945b884a6dfd526c03abdd2a5d3fa3f')

package() {
    install -Dm755 "${_pkgname}-v${pkgver}-${arch}-unknown-linux-musl" \
        "${pkgdir}/usr/bin/rres"
}
