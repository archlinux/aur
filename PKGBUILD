# Maintainer: Arseniy <senyaaa@tuta.io>
pkgname=capyfetch
pkgver=1.0
pkgrel=1
pkgdesc="A script to display system information with a capybara"
arch=('any')
url="https://github.com/Senya44ka/capyfetch"
license=('GPL2')
depends=('python' 'python-colorama' 'python-psutil' 'python-distro')
source=("capyfetch.py")
md5sums=('SKIP')  

package() {
    install -Dm755 "$srcdir/capyfetch.py" "$pkgdir/usr/bin/capyfetch"
}

