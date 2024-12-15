# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=ttf-dmcasansserif
pkgver=9.0_20252
pkgrel=4
pkgdesc="General purpose sans serif font metric-compatible with Microsoft Consolas"
arch=('any')
license=('Unlicense')
url="https://typedesign.replit.app"
source=(${pkgname}-${pkgver}.zip::"${url}/DMCAsansserif${pkgver/_/-}.zip")
sha256sums=('ee9a205e84fd8913f53e6845cfdbe7a915104d7d1989761bd0e0cd43ca5d436d')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
