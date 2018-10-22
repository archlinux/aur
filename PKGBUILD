# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Matt Spaulding <matt at mattops dot io>

pkgname=ibm-plex-fonts
pkgver=1.2.1
pkgrel=1
pkgdesc="The package of IBM’s typeface, IBM Plex."
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("$url/releases/download/v$pkgver/TrueType.zip")
sha256sums=('73f6afefcf3d56d5c7f45d788b7c65c6986183e2efff1576f731b2a5e99df6de')

package() {
    cd TrueType
    install -Dm644 */*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
