# Maintainers: goetzc
# Contributors: Jni <jni.viens at protonmail dot com>
pkgname=bitrise
pkgver=1.48.0
pkgrel=1
pkgdesc="Run your bitrise.io automations offline"
arch=('x86_64')
url="https://github.com/bitrise-io/bitrise"
license=('MIT')
provides=('bitrise')
optdepends=('envman' 'stepman')
install=$pkgname.install
source=("https://github.com/bitrise-io/bitrise/releases/download/$pkgver/bitrise-Linux-$CARCH"
        https://raw.githubusercontent.com/bitrise-io/bitrise/master/LICENSE)

package() {
  install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$srcdir/$pkgname-Linux-$CARCH" "$pkgdir/usr/bin/bitrise"
}

sha256sums=('3da2e213ba09cb76d80316695aa15f4586f9bb8bc2c9d5df2925cb52f45fd31a'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
