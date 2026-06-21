# Maintainer: tee < teeaur at duck dot com >
_pkgname=webhookd
pkgname=webhookd-bin
pkgver=1.22.0
pkgrel=1
pkgdesc='A very simple webhook server launching shell scripts'
arch=('x86_64' 'aarch64')
url='https://github.com/ncarlier/webhookd'
license=('MIT')
provides=('webhookd')
conflicts=('webhookd')
depends=('glibc')
source_x86_64=("$_pkgname-$pkgver-$CARCH.tgz::$url/releases/download/v$pkgver/webhookd-linux-amd64.tgz")
sha256sums_x86_64=('9ce7ee86c67cacb841cbf5bc88b2b0817f2a2ba649518e57ded930faf2530bd9')

package() {
  install -Dm755 webhookd -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
