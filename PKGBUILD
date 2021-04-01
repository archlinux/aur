# Maintainer: Leonard Janis König <ljrk@ljrk.org>

pkgname='otf-nexus-sans-pro'
pkgver=1
pkgrel=1
pkgdesc='Nexus Sans font, used by e.g., the Freie Universität Berlin'
arch=('any')
url='http://fontfont.com'
license=('custom:fontfont.com')
source=('file://NexusSansPro.zip'
        'http://www.fontfont.com/eula/license.html')
sha256sums=('c3fe0733fd74deb9ebf41c4b69b3e1f7cfc55a2654df48cdf80ae07b1d92d720'
            'c357c78a3ca2e1febd54741b478d0fc2d68746df7686ec119ea8509650e4d203')

package() {
    install -Dm655 "${srcdir}"/*.otf \
        -t "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 license.html \
        "${pkgdir}"/usr/share/licenses/${pkgname}/license.html
}
