# Maintainer: rooyca <rooyca.f9rnz at aleeas dot com>
pkgname=hmta
pkgver=1.0.1
pkgrel=1
pkgdesc="Do you wanna know how much time would take you to watch an anime? Well, this is your tool."
arch=('i686' 'x86_64')
url="https://github.com/Rooyca/hmta"
license=('MIT')
depends=('python' 'python-urllib3')
source=("https://github.com/Rooyca/hmta/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('590f76d949efecaebcdc9ce818e80e1d3f5fa6dd13467ee458a1bfb5dafe29f9')

build() {
    cd "$srcdir/hmta-$pkgver"
}

package() {
    cd "$srcdir/hmta-$pkgver"
    install -Dm755 hmta.py "$pkgdir/usr/bin/hmta"
}