# Maintainer: Luke R. <g4jc@hyperbola.info>

pkgname=diatheke-tui
pkgver=1.0
pkgrel=2
pkgdesc="A whiptail TUI for diatheke bible software"
arch=('any')
url='https://github.com/g4jc/diatheke-tui'
license=('CC0')
depends=('libnewt' 'sword')
optdepends=('curl: downloading modules'
            'libcaca: ascii image/map viewer'
            'unzip: installing modules')
source=("${pkgname}-v${pkgver}.zip::https://github.com/g4jc/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip"
        
"${pkgname}-v${pkgver}.zip.sig::https://github.com/g4jc/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip.sig")
validpgpkeys=('6AE59096491F29FB64E81A33AEAADD85D2F527B0')
sha512sums=('a5f6603d2557adc55facd9757710246f7790aeb3d0d148ba68744e16e666027e7940d120bead5c592435861bdd2529bcf25b1ad8eedd00b20eed2c0291848e5d'
            'SKIP')

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/diatheke-tui.sh" \
	"${pkgdir}/usr/bin/${pkgname}"
}

