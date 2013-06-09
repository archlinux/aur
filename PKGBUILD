# Maintainer: Siôn Le Roux <sinisterstuf@gmail.com>

pkgname=tomboy-calc
pkgver=0.40
pkgrel=1
pkgdesc="A tomboy plugin to compute mathematical equations in notes."
url="http://www.robpvn.net/calcaddin/"
depends=('tomboy')
arch=(any)
license=(GPL)
source=("https://github.com/downloads/robpvn/Tomboy-Calculator-Addin/tomboy_calculatoraddin.zip")
md5sums=('9c9163cb6d1c0cda18a7844b1af53a47')

package() {
    install -Dm644 $srcdir/MathLib.dll $pkgdir/usr/lib/tomboy/addins/MathLib.dll
    install -Dm644 $srcdir/CalculatorAddin.dll $pkgdir/usr/lib/tomboy/addins/CalculatorAddin.dll
}