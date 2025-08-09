# Maintainer: Ravi Kiran <ravi742t7p@gmail.com>
pkgname=ravikiran-portfolio
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal-based interactive portfolio of Ravi Kiran"
arch=('any')
url="https://github.com/RaviKiran752/ravi"
license=('MIT')
depends=('python' 'python-rich')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

#package() {
#    cd "$srcdir"/*  # instead of hardcoding the folder name
#    install -Dm755 portfolio.py "$pkgdir/usr/bin/ravikiran"
#}

package() {
    cd "$srcdir/ravi-$pkgver"
    install -Dm755 portfolio.py "$pkgdir/usr/bin/ravikiran"
}

