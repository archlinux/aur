# Maintainer: Arseniy senyaaa@tuta.io

pkgname=anyfetch
pkgver=1.1
pkgrel=1
pkgdesc="A fetch utility that allows uploading ASCII art via a web interface"
arch=('any')
url="https://github.com/Senya44ka/anyfetch"
license=('GPL3')
depends=('python' 'python-psutil' 'python-requests' 'python-colorama' 'python-distro')
source=("anyfetch.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/anyfetch.py" "$pkgdir/usr/bin/anyfetch"
}

