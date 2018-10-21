# Maintainer: Michael Polidori <michaelapolidori@gmail.com>
# Author: Carl Bordum Hansen <carl@bordum.dk>

pkgname=manly
pkgver=0.3.3
pkgrel=1
pkgdesc="A compliment to the man pages."
url="https://github.com/Zaab1t/manly"
depends=('python')
license=('MIT')
arch=('any')
source=('git+https://github.com/carlbordum/manly.git')
md5sums=(SKIP)

package() {
    cd $pkgname
    mv manly.py manly
    install -Dm 0755 -t ${pkgdir}/usr/bin manly
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
