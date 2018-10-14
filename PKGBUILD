# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Matt Spaulding <matt at mattops dot io>

pkgname=ibm-plex-fonts
pkgver=1.1.6
pkgrel=1
pkgdesc="The package of IBM’s typeface, IBM Plex."
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("$url/releases/download/v$pkgver/TrueType.zip")
sha256sums=('ae870b742ec69d6a3423d7b70623863cda146d1b082d6d20b5cf7a140fbb210d')

package() {
    cd TrueType
    install -Dm644 */*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
