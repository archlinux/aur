# Maintainer: Michael Polidori <michaelapolidori at gmail dot com>
# Author: Carl Bordum Hansen <carl at bordum dot dk>

pkgname=manly
pkgver=0.4.0
pkgrel=1
pkgdesc="A compliment to the man pages."
url="https://github.com/carlbordum/manly"
depends=('python')
license=('MIT')
arch=('any')
source=('git+https://github.com/mpolidori/manly.git')
md5sums=(SKIP)

package() {
  cd "$srcdir/$pkgname"
  mv manly.py manly
  install -Dm 0755 -t ${pkgdir}/usr/bin manly
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
