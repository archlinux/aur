# Maintainer: tee < teeaur at duck dot com >
_pkgname=webhookd
pkgname=webhookd-bin
pkgver=1.20.2
pkgrel=2
pkgdesc='A very simple webhook server launching shell scripts'
arch=('x86_64' 'aarch64')
url='https://github.com/ncarlier/webhookd'
license=('MIT')
provides=('webhookd')
conflicts=('webhookd')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver-$arch.tgz::$url/releases/download/v$pkgver/webhookd-linux-amd64.tgz")
sha256sums_x86_64=('815d5c3f9e569af317bd2a0ce28fe1603f570b2c1effaa32f0bc3b697f939fe4')

package() {
  install -Dm755 "$srcdir/webhookd" "$pkgdir/usr/bin/webhookd"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 "$srcdir/README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 "$srcdir/CHANGELOG.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
