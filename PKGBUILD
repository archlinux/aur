pkgname=m-tools
pkgver=2.0
pkgrel=1
pkgdesc='a fast and lightweight bash-based text editing tool. M was previously in the "M" package on the AUR, but it has been moved to "m-tools" for easier installation.'
arch=('any')
url="https://aur.archlinux.org/packages/m"
license=('MIT')
depends=()
source=("m")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/m" "$pkgdir/usr/bin/m"
}

