# Maintainer: Bernardo Kuri <aur+tofi-cotp@bkuri.com>
pkgname=tofi-cotp
pkgver=1.0.1
pkgrel=1
pkgdesc="A tofi wrapper for cotp (CLI TOTP authenticator)"
arch=('any')
url="https://github.com/bkuri/tofi-cotp"
license=('MIT')
depends=('cotp' 'tofi' 'libsecret' 'wl-clipboard' 'zenity')
optdepends=('libnotify: for desktop notifications')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d1602e579f22131a494dc3297eeb6ae08427aedb5458b57f3fd76a513b19cc84')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    install -Dm755 tofi-cotp "${pkgdir}/usr/bin/tofi-cotp"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
