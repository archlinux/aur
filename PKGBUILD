# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-tilix
pkgver=0.1.0
pkgrel=1
pkgdesc="Tempus themes for Tilix terminal (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('tilix')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('4f967c3790c23960171618bc402a962280bb7be511cc71c282774cf2a5e5c00a48106553e1fd262f18c185505e4f67a2678913789a0cc416e4fe0fbef168a019')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/tilix/schemes"
  install -Dm 644 *.json \
    "$pkgdir/usr/share/tilix/schemes/"
}
