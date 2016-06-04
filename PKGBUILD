# Maintainer: Jni <jni.viens at protonmail dot com>
pkgname=stepman
pkgver=0.9.19
pkgrel=1
pkgdesc="Manage decentralized StepLib Step (script) Collections."
arch=(x86_64)
url="https://github.com/bitrise-io/stepman"
license=('MIT')
provides=(stepman)
source=(https://github.com/bitrise-io/stepman/releases/download/$pkgver/$pkgname-Linux-$CARCH
        https://raw.githubusercontent.com/bitrise-io/stepman/master/LICENSE)
md5sums=('97482b1f85b0c7216dd6c0486d8d045d'
         '10c39cc7466456c17298b32d04bfa8d9')

package() {
  install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$srcdir/$pkgname-Linux-$CARCH" "$pkgdir/usr/bin/stepman"
}
