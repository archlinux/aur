# Maintainer: helix <stargr@gmail.com>
pkgname=subedit
pkgver=1.2.2
pkgrel=1
pkgdesc='Subtitle editor written in bash'
arch=('any')
license=('GPL2')
depends=('bash' 'dos2unix' 'uchardet')
url="https://github.com/helixarch/subedit"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/subedit/archive/$pkgver.tar.gz"
        "subedit.install")

sha512sums=('f57faf55eeda68db316b738e29a2ffed4d2dd5c981740a56625346c052bf1bbd08d6cbab34913e4c5382d6a4d68851d759b810370f0abd8dc41859af6039fd2b'
            'baee56c87a9ed1974c6c5793472290d3302e0236a7bdcc585a841c5455463fba43ec2a6c10fa5945b39f60917eb88c0b6c1b2187ddbdcea6da758783df702d14')

install=subedit.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 subedit "$pkgdir/usr/bin/subedit"
  install -Dm644 subeditrc "$pkgdir/etc/subeditrc"
}
