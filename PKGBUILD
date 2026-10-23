# Maintainer: tee < teeaur at duck dot com >
_pkgname=webhookd
pkgname=webhookd-bin
pkgver=1.22.1
pkgrel=1
pkgdesc='A very simple webhook server launching shell scripts'
arch=('x86_64' 'aarch64')
url='https://github.com/ncarlier/webhookd'
license=('MIT')
provides=('webhookd')
conflicts=('webhookd')
depends=('glibc')
source_x86_64=("$_pkgname-$pkgver-$CARCH.tgz::$url/releases/download/v$pkgver/webhookd-linux-amd64.tgz")
sha256sums_x86_64=('7a1f4edd1e47c93851074e39ed5f2634c0b0734e8d9d4200d570ec04df0bee29')

package() {
  install -Dm755 webhookd -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
