# Maintainer: Your Name <your_email@example.com>
pkgname=spaces
pkgver=11.0
pkgrel=1
pkgdesc="A CLI tool that help u open your apps easier"
arch=('any')
url="https://github.com/simit22/spaces"
license=('GPL')
depends=('python' 'python-rich' 'python-argparse')
source=("main.py")
md5sums=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 main.py "$pkgdir/usr/bin/spaces"  # Install the main script as 'spaces'
}
