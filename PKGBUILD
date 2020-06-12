# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=marcellus
pkgbase=$_name-font
pkgname=(ttf-$_name ttf-$_name-sc)
pkgver=1.000
pkgrel=1
pkgdesc='A set of flared serif typefaces inspired by classic Roman inscription letterforms'
arch=('any')
url="https://fonts.google.com/specimen/Marcellus"
license=('OFL')
source=("$_name-$pkgver.zip::https://fonts.google.com/download?family=Marcellus"
        "$_name-$pkgver-sc.zip::https://fonts.google.com/download?family=Marcellus+SC")
sha256sums=('410a303c5ed8d546cec8ee3293c3094d1d1b05901aa1a1e27cbe65243e9cefaa'
            '2d10c91081b663919f49851d67b259e3c95becf43ad3e0d4ede0e5b3ea7d66b0')

package_ttf-marcellus() {
    provides=("$pkgbase")
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" Marcellus-Regular.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-marcellus-sc() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" MarcellusSC-Regular.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
