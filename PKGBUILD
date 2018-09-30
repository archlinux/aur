# Maintainer: axionl <axionl@aosc.io>
pkgname=skm
pkgver=0.5.3
pkgrel=1
pkgdesc="A simple and powerful SSH keys manager."
arch=('x86_64')
url="https://github.com/TimothyYe/skm"
license=('MIT')
source=(skm-linux64-$pkgver.tar.gz::https://github.com/TimothyYe/skm/releases/download/V$pkgver/skm-linux64-$pkgver.tar.gz
        'LICENSE'
        )

md5sums=('bd602cd9820474ead84ff8a9f3756cf5'
         '23f496e588b7f087e293808efbd625af')

package() {
  dir="$srcdir"
  install -Dm755 $dir/skm ${pkgdir}/usr/bin/skm
  install -Dm755 LICENSE ${pkgdir}/usr/share/licenses/skm/LICENSE
}
