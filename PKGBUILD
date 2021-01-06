# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=curl-pulse-secure
pkgver=7.73.0
pkgrel=1
pkgdesc="curl $pkgver-$pkgrel libraries for pulse-secure"
arch=('x86_64')
url="https://aur.archlinux.org/$pkgname"
source=("libcurl.so.4.7.0.gz")
md5sums=('e1c5aae1efcda110138caeb8821bc61e')

package() {
  install -Dm0755 libcurl.so.4.7.0 "$pkgdir/usr/local/pulse/libcurl.so.4.7.0"
  ln -s libcurl.so.4.7.0 "$pkgdir/usr/local/pulse/libcurl.so.4"
  ln -s libcurl.so.4.7.0 "$pkgdir/usr/local/pulse/libcurl.so"
}
