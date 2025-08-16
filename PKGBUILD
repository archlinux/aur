pkgname=m-tools
pkgver=2.6.0
pkgrel=1
pkgdesc='a fast and lightweight bash-based text editing tool'
arch=('any')
license=('MIT')
depends=()
source=("https://raw.githubusercontent.com/alahmedi/m/refs/heads/main/m")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/m" "$pkgdir/usr/bin/m"
}

