# Maintainer: Jni <jni.viens at protonmail dot com>
pkgname=bitrise
pkgver=1.3.4
pkgrel=1
pkgdesc="Run your bitrise.io automations offline"
arch=(x86_64)
url="https://github.com/bitrise-io/bitrise"
license=('MIT')
depends=(envman stepman)
provides=(bitrise)
install=$pkgname.install
source=(https://github.com/bitrise-io/bitrise/releases/download/1.3.4/bitrise-Linux-$CARCH
        https://raw.githubusercontent.com/bitrise-io/bitrise/master/LICENSE)
md5sums=('1bc712c3ac35d12c6796c4e87ecff083'
         '10c39cc7466456c17298b32d04bfa8d9')

package() {
  install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$srcdir/$pkgname-Linux-$CARCH" "$pkgdir/usr/bin/bitrise"
}
