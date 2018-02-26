# Maintainer: axionl <axionl@aosc.io>
pkgname=skm
pkgver=0.5.2
pkgrel=1
pkgdesc="A simple and powerful SSH keys manager."
arch=('x86_64')
url="https://github.com/TimothyYe/skm"
license=('MIT')
source=(skm-linux64-$pkgver.tar.gz::https://github.com/TimothyYe/skm/releases/download/V$pkgver/skm-linux64-$pkgver.tar.gz
        'LICENSE'
        )

md5sums=('b0b00e6ab97453a9dcc1bad9d8f43ec6'
         '23f496e588b7f087e293808efbd625af')

package() {
  dir="$srcdir"
  install -Dm755 $dir/skm ${pkgdir}/usr/bin/skm
  install -Dm755 LICENSE ${pkgdir}/usr/share/licenses/skm/LICENSE
}
