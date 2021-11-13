# Maintainer: Abdur Rehman Imran <arehmanimran4@gmail.com>
pkgname=pyorg
pkgver=1.0.0
pkgrel=2
pkgdesc="A CLI folder organizer written in Python."
arch=('x86_64')
url="https://github.com/abdurehman4/pyorg"
license=('GPL')
depends=('python' 'python-termcolor')
source=("git+https://github.com/abdurehman4/pyorg.git")


package() {
    cd pyorg
    mkdir "$pkgdir/usr"
    mkdir "$pkgdir/usr/bin"
    cp ./pyorg "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/pyorg"
}
sha256sums=('SKIP')
