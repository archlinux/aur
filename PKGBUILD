pkgname=spaces
pkgver=5.0
pkgrel=1
pkgdesc="A CLI tool that helps you open your apps more easily"
arch=('any')
url="https://github.com/simit22/spaces"
license=('GPL')
depends=('python' 'python-rich')
source=("main.py")
md5sums=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 main.py "$pkgdir/usr/bin/spaces"  # Install the main script as 'spaces'
}
