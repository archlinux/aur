# Maintainers: goetzc
# Contributors: Jni <jni.viens at protonmail dot com>
pkgname=bitrise
pkgver=1.42.0
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

sha256sums=('d75cc141c159d9f52c109114483d9d0ce7679509904721489f4991921472bef2'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
