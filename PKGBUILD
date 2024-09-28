#Proud to make this AUR package
pkgname=markustools
pkgver=1.2.1
pkgrel=6
pkgdesc="A tool for games, editing and other plain, dumb stuff (coded in Python)"
arch=('x86_64')
url="https://techmarkus.com/markustools.html"
license=('GPL')
depends=('python' 'cmatrix' 'neofetch' 'cowsay' 'fortune-mod')
source=("markustools.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/markustools.py" "${pkgdir}/usr/bin/markustools"
}
