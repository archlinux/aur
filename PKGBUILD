pkgname=jfetch
pkgver=0.4
pkgrel=1
pkgdesc="A python-based, minimalist neofetch-like script."
arch=('x86_64')
url="https://github.com/blobbo7/jfetch"
license=('GPL')

source=("https://github.com/blobbo7/jfetch/releases/download/0.4/jfetch")
sha256sums=('06baf784683a2211663e182ee55eff5f8beb2131d6f8b5377bd02538c9e24da0')

package() {
  install -Dm755 "$srcdir/jfetch" "$pkgdir/usr/bin/jfetch"
}

