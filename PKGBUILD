# Maintainer: Emily3403 <seebeckemily3403@gmail.com>
# Attention: Currently it is not possible to install!

pkgname=isisdl
pkgver=1.3.6
pkgrel=1
pkgdesc='A downloading utility for ISIS of TU-Berlin. Download all your files and videos from ISIS.'
url='https://github.com/Emily3403/isisdl'
arch=('x86_64')
license=('GPL3')
provides=('isisdl')
depends=('zlib')
source=("https://github.com/Emily3403/isisdl/releases/download/V1.3/isisdl-linux.bin")
sha256sums=('7e6aed72bab254baebbdea95e30d2b620475fdce56bc8a613327d774977511cc')

OPTIONS=(!strip)

package() {
    install -Dm755 "isisdl-linux.bin" "$pkgdir/usr/bin/isisdl"
}