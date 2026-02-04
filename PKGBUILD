# Maintainer: tee < teeaur at duck dot com >
_pkgname=webhookd
pkgname=webhookd-bin
pkgver=1.21.0
pkgrel=1
pkgdesc='A very simple webhook server launching shell scripts'
arch=('x86_64' 'aarch64')
url='https://github.com/ncarlier/webhookd'
license=('MIT')
provides=('webhookd')
conflicts=('webhookd')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver-$CARCH.tgz::$url/releases/download/v$pkgver/webhookd-linux-amd64.tgz")
sha256sums_x86_64=('60ddf9a21af6819711347f88e3d874bf7327c4bb47d3dfd25896f675851aa77b')

package() {
  install -Dm755 "$srcdir/webhookd" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 "$srcdir/README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 "$srcdir/CHANGELOG.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
