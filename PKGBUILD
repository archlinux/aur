pkgname=i-use
pkgver=1.0
pkgrel=1
pkgdesc="A script that displays your distribution with flair!"
arch=('any')
license=('GPL')
url="https://aur.archlinux.org/"
source=("i-use.sh")
depends=('lsb-release')
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/i-use.sh" "$pkgdir/usr/bin/iuse"
}
