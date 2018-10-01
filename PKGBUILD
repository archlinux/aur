# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=webplotdigitizer-bin
pkgver=4.1
pkgrel=1
pkgdesc='Tool to extract numerical data from plot images'
url='https://automeris.io/WebPlotDigitizer/'
arch=('x86_64')
license=('AGPL3')
depends=()
source=('https://automeris.io/downloads/WebPlotDigitizer-4.1-linux-x64.zip')
md5sums=('6d6b74f94f5922cfe9b24a1dbe035edd')
sha256sums=('7cfffa19d160c07df71121fe005fdcdb1fdd48dd3e70fb391dcbe5ca529bafd8')

package() {
    mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
    cp -r WebPlotDigitizer-linux-x64 "$pkgdir/opt/WebPlotDigitizer"
    ln -s /opt/WebPlotDigitizer/WebPlotDigitizer "$pkgdir/usr/bin/WebPlotDigitizer"
}
