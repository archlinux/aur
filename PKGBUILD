# Maintainer: Your Name <youremail@example.com>
pkgname=displayfetch
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple Python script that displays system info, more specifically display info."
arch=('any')
url="https://github.com/luxiumstudios/displayfetch"
license=('MIT')
depends=('python')
source=("git+https://github.com/luxiumstudios/displayfetch.git")
sha256sums=('SKIP')

package() {
    # Install the script as an executable command
    install -Dm755 "$srcdir/displayfetch/displayfetch.py" "$pkgdir/usr/bin/displayfetch"
}
