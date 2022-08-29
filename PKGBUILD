# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-saira-variable
pkgver=1.101
pkgrel=2
pkgdesc='Contemporary sans-serif typeface system from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/saira/'
license=('OFL')
_commit='1916f2a575479b626238d9842126e63aa208eebf'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Saira/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Saira/${_commit}/Saira/fonts/variable/Saira-Italic[wdth,wght].ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/Saira/${_commit}/Saira/fonts/variable/Saira[wdth,wght].ttf")

sha256sums=('f2665d4718b452b3818a877191355ac884a6b9b419d35408fe7ee487e9e8f30f'
            '965972c2543b72948aedb55fae36e23175661d0f9d2d8d7f14a1009e466912f8'
            '9d050fc5a01c85f74c4257c207d50b55d1e40c37308c642f974a2c5003231dde')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
