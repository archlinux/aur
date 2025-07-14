pkgname=m-tools
pkgver=2.1
pkgrel=1
pkgdesc='a fast and lightweight bash-based text editing tool'
arch=('any')
url="https://github.com/kayemaye/m"
license=('MIT')
depends=()
source=("https://github.com/kayemaye/m/releases/download/v2.0/m")
sha256sums=('d71f8591b7b9c16b6faba5e3971248b288eb205bb7ad9fe87acc58b77664a5b')

# sorry envolution. first time on the AUR, didnt know to do this stuff. thanks.
# BUT, my package is useful tho? like read the pkgdesc dude???

package() {
  install -Dm755 "$srcdir/m" "$pkgdir/usr/bin/m"
}

