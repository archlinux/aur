pkgname=hexer-cli
pkgbase=hexer-cli
pkgver=0.1
pkgrel=1
pkgdesc="Hexer terminal GUI"
arch=('any')
url="https://github.com/azuk13215/Hexer"
license=('GPL3')

depends=('python' 'python-pyqt6')

source=("git+https://github.com/azuk13215/Hexer.git")

sha256sums=('SKIP')

package() {
    cd Hexer

    install -Dm755 main.py "$pkgdir/usr/bin/hexer-cli"
}

