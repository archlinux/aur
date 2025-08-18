# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=hours
pkgname=$_projectname-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A no-frills time tracking toolkit for command line nerds"
arch=("x86_64")
url="https://github.com/dhth/hours"
license=("MIT")
provides=("hours")
conflicts=("hours")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_projectname}_${pkgver}_linux_amd64.tar.gz")
b2sums=('5c3cb67f82ac62c9f0f89bd5bd6bda9d422ed1fc57ea91ec4c62e412babc6e249b4c0a511ecb4491b19d2b83f50887318e534a30689f59a89ccbff4b538bad8f')

package() {
    install -Dm 755 $_projectname "$pkgdir/usr/bin/$_projectname"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_projectname/LICENSE"
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$_projectname/README.md"
}
