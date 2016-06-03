# Maintainer: Jni <jni.viens at protonmail dot com>
pkgname=envman
pkgver=1.1.0
pkgrel=1
pkgdesc="Manage your Environment Variable collections."
arch=(x86_64)
url="https://github.com/bitrise-io/envman"
license=('MIT')
provides=(envman)
source=(https://github.com/bitrise-io/envman/releases/download/$pkgver/$pkgname-Linux-$CARCH
        https://raw.githubusercontent.com/bitrise-io/envman/master/LICENSE)
md5sums=('ea369a4bb1acc001e891a2929377a04f'
         '10c39cc7466456c17298b32d04bfa8d9')

package() {
  install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$srcdir/$pkgname-Linux-$CARCH" "$pkgdir/usr/bin/envman"
}
