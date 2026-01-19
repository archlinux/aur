# Maintainer: Finn <f1nnsauce.business@proton.me>
pkgname=pvm-git
pkgver=0.1.0.r20260119
pkgrel=2
pkgdesc="Loader for PVM, a Turing-Complete programming language"
arch=('any')
url="https://github.com/f1nnsauce/pvm"
license=('MIT')
depends=('python' 'python-pygame')
makedepends=('git')
source=('pvm-wrapper.py')
sha256sums=('SKIP')

pkgver() {
    # Generate a pseudo-version based on date
    echo "0.1.0.r$(date +%Y%m%d)"
}

package() {
    install -Dm755 "${srcdir}/pvm-wrapper.py" "$pkgdir/usr/local/bin/pvm"
}
