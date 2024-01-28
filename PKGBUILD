# Maintainer: Aurelien Grosdidier <aurelien.grosdidier@gmail.com>

pkgname=onionpipe-bin
_realname=onionpipe
pkgver=1.1.2
pkgrel=1
pkgdesc="Onion addresses for anything."
url="https://github.com/cmars/onionpipe"
arch=(x86_64)
license=('MIT')
depends=('tor')
provides=('onionpipe=${pkgver}')
conflicts=('onionpipe')
source=("https://github.com/cmars/${_realname}/releases/download/v${pkgver}/${_realname}-linux-amd64-static")
sha256sums=('5ec5f29e351c0a6b26fa36d40e88c86869702a0227fb1e11ae024214da3ae698')

package() {
    install -D -m 755 ${_realname}-linux-amd64-static "${pkgdir}/usr/bin/${_realname}"
}

# vim:set ts=2 sw=2 et:
