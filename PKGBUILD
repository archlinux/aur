# Maintainer: Yamashiro <dev cosmicheron com>

_pkgbase='comet-gog'
pkgname="${_pkgbase}-bin"
pkgdesc='Open Source implementation of GOG Galaxy Communication Service for SDK bundled with GOG games'
pkgver='v0.1.2'
pkgrel='1'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
url='https://github.com/imLinguin/comet'
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source_x86_64=("${url}/releases/download/${pkgver}/comet-x86_64-unknown-linux-gnu")
sha512sums_x86_64=('06f088cbda1aef8a6fcf9251285838e0dc95a225f99b5e45a4afdf30b48c78b7d42a931781995dba8273edf448d69862d0b4255249068aecde865b29f4e92b42')
source_aarch64=("${url}/releases/download/${pkgver}/comet-aarch64-unknown-linux-gnu")
sha512sums_aarch64=('b503334731946c9e6aa3e7ac73567e78bc5fe853544247999b4bfcf3030f3d00ef7783ea37ff22c2861f91cadd95ed81dc5d099c672a2dce04150b5504c2f164')
options=(!debug !strip)

package(){
	install -Dm755 "${srcdir}/comet-${CARCH}-unknown-linux-gnu" "${pkgdir}/usr/bin/comet"
}
