pkgname=i3-env
pkgver=0.2
pkgrel=1
arch=('any')
depends=('emuto')
source=(git://github.com/kantord/i3-env.git)
md5sums=('SKIP')

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/i3-env/i3-env"
  install -D -t "$pkgdir/usr/bin" "$srcdir/i3-env/i3-env-rofi"
}
