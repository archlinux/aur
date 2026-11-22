# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-asap-sharp-variable
pkgver=3.002
pkgrel=1
pkgdesc='Contemporary sans-serif typeface family from Omnibus-Type.'
arch=('any')
url='https://www.omnibus-type.com/fonts/asap-sharp/'
license=('OFL')
_commit='41d013ad7c374fd7fc3f5fc99571b582020d509b'
source=("${pkgname}-${pkgver}-${pkgrel}-OFL.txt::https://raw.githubusercontent.com/Omnibus-Type/Asap_Sharp/${_commit}/OFL.txt"
        "https://raw.githubusercontent.com/Omnibus-Type/Asap_Sharp/${_commit}/fonts/VARIABLE/AsapSharp-Italic[wdth,wght].ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/Asap_Sharp/${_commit}/fonts/VARIABLE/AsapSharp[wdth,wght].ttf")

sha256sums=('3f0a89775c7933112b55fc351dc864683f09e9ac4afe56d36f81bf5dd793f146'
            '6d79e6fa638811249e348a5265883818d75829db0fe84408bb2c7dd9d373d93e'
            '0c5f2706889214e8102fc97890e34d5f3a02f5203c198c7711987efcf6124e23')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
