pkgname=jfetch
pkgver=0.3
pkgrel=1
pkgdesc="A python-based, minimalist neofetch-like script."
arch=('x86_64')
url="https://github.com/blobbo7/jfetch"
license=('GPL')

source=("https://github.com/blobbo7/jfetch/releases/download/0.3/jfetch")
sha256sums=('bcab6ecb3607642fd2906f9e45c053217575dbca98438061c2d038d9ef241903')

package() {
  install -Dm755 "$srcdir/jfetch" "$pkgdir/usr/bin/jfetch"
}

