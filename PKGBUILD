# Maintainer: Qingxu 
pkgname=yesplaymusic
pkgver=0.3.1
pkgrel=1
pkgdesc="High-value third-party NetEase cloud player"
arch=("x86_64")
url="https://github.com/qier222/YesPlayMusic/"
license=('custom')
depends=( 
    'nss'
    'gtk3'
)
source=(
	"https://github.com/qier222/YesPlayMusic/releases/download/${pkgver}/YesPlayMusic_${pkgver}_amd64.deb"
)
md5sums=('3761bcb8c5156e9ab2c856c99e9562b6')

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
}
