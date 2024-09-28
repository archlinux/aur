#Proud to make this AUR package
pkgname=markustools
pkgver=1.1.1
pkgrel=1
pkgdesc="A tool for games, editing and other plain, dumb stuff (coded in Python)"
arch=('x86_64')
url="https://techmarkus.com/markustools.html"
license=('GPL')
depends=('python' 'nano' 'git' 'cmatrix' 'neofetch' 'cowsay' 'fortune-mod' 'less')
source=("markustools.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/markustools.py" "${pkgdir}/usr/bin/markustools"
}
