# Maintainer: helix <stargr@gmail.com>
pkgname=subedit
pkgver=1.1
pkgrel=1
pkgdesc='Subtitle editor written in bash'
arch=('any')
license=('GPL2')
depends=('bash' 'dos2unix' 'uchardet')
url="https://github.com/helixarch/subedit"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/subedit/archive/$pkgver.tar.gz"
        "subedit.install")

sha512sums=('f36d91d0ba5aaf13a3bf3b5c38f7525f09de6dc4f6e30a81c8bfc8b4e93d49a50d0896ecf0ee04497f0bee2f279dbe99bbf7876ada5fd40078657bbe943e2377'
            'baee56c87a9ed1974c6c5793472290d3302e0236a7bdcc585a841c5455463fba43ec2a6c10fa5945b39f60917eb88c0b6c1b2187ddbdcea6da758783df702d14')

install=subedit.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 subedit "$pkgdir/usr/bin/subedit"
  install -Dm644 subeditrc "$pkgdir/etc/subeditrc"
}
