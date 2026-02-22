pkgname=manu-hello-test
pkgver=0.1.0
pkgrel=1
pkgdesc="Test hello world package by Manu"
arch=('any')
url="https://example.com"
license=('MIT')
depends=('bash')
source=("hello.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 hello.sh "$pkgdir/usr/bin/manu-hello-test"
}
