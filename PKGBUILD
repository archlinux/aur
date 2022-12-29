# Contributor: Adel Khial <adel.khial@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-nunito-sans
pkgver=1.0
pkgrel=3
pkgdesc="A well balanced sans serif font by Jaques Le Bailly."
arch=('any')
url=https://fonts.google.com/specimen/Nunito+Sans
license=('custom:OFL')
source=("Nunito_Sans.zip::https://fonts.google.com/download?family=Nunito%20Sans")
sha256sums=('d78c9217be117541f86fe6978822772e32fa9b41d9a4b5bd4e0cfd012b553292')

package () {
        install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
        install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}"/OFL.txt
}
