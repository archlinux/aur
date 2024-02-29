# Maintainer: Emily3403 <seebeckemily3403@gmail.com>
# Attention: Currently it is not possible to install!

pkgname=isisdl
pkgver=1.3.19
pkgrel=1
pkgdesc='A downloading utility for ISIS of TU-Berlin. Download all your files and videos from ISIS.'
url='https://github.com/Emily3403/isisdl'
arch=('x86_64')
license=('GPL3')
provides=('isisdl')
depends=('zlib')
source=("https://github.com/Emily3403/isisdl/releases/download/V1.3/isisdl-linux.bin")
sha256sums=('b97ba1f08dff6348c96795576fa2711b7d1fc6b3c5e89f401b62ad6bfc47424b')

OPTIONS=(!strip)

package() {
    install -Dm755 "isisdl-linux.bin" "$pkgdir/usr/bin/isisdl"
}
