# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=butler
pkgbase=$_name-font
pkgname=(otf-$_name otf-$_name-stencil)
pkgver=1.000
pkgrel=1
pkgdesc='A serif font family inspired by Dala Floda & the Bodoni family'
arch=('any')
url="http://fabiandesmet.com/portfolio/$pkgbase"
license=('custom')
source=("https://fabiandesmet.com/wp-content/uploads/Butler_and_ButlerStencil.zip")
sha256sums=('ebf56a01103f100420cb4e54accd0ab839d064dbae462d72294212a5e5d9a798')

package_otf-butler() {
    cd ${_name^}
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../Butler_ButlerStencil_FontLicense_v1_1.pdf
}

package_otf-butler-stencil() {
    cd ${_name^}_Stencil
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../Butler_ButlerStencil_FontLicense_v1_1.pdf
}
