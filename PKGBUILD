# Maintainer: Abdur Rehman Imran <arehmanimran4@gmail.com>
pkgname=fsorter
pkgver=1.0.5
pkgrel=2
pkgdesc="A CLI folder organizer written in Python."
arch=('x86_64')
url="https://github.com/abdurehman4/fsorter"
license=('GPL')
depends=('python' 'python-termcolor')
source=("git+https://github.com/abdurehman4/fsorter.git")


package() {
    cd fsorter
    mkdir "$pkgdir/usr"
    mkdir "$pkgdir/usr/bin"
    rm -R "$pkgdir/usr/bin/fsorter"
    cp ./fsorter "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/fsorter"
}
sha256sums=('SKIP')
