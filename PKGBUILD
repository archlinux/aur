# Maintainer: Siavash Askari Nasr <ciavash@proton.me>

_app_name=gex
pkgname="${_app_name}-bin"
pkgver=0.6.4
pkgrel=1
pkgdesc="Git Explorer: cross-platform git workflow improvement tool inspired by Magit"
arch=('x86_64')
url='https://github.com/Piturnah/gex'
license=('MIT' 'Apache')
provides=('gex')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_app_name}-${arch}-unknown-linux-gnu.tar.gz"
        "${url}/raw/master/LICENSE-MIT")
sha256sums=('410c396e063883959991d3d0b91806dd1a32c8696348fe90287ae746fa673aa6'
            '0023207044809c8c0d717f0822f777673d9653d87d4aaf81cc9bff4e60016b54')

package() {
    install -Dm755 "${_app_name}" -t "${pkgdir}/usr/bin"

    install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${_app_name}"
}
