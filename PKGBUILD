# Maintainers: Götz
# Contributors: Jni <jni.viens at protonmail dot com>
pkgname=bitrise
pkgver=2.1.0
pkgrel=1
pkgdesc="Run your bitrise.io automations offline"
arch=('x86_64')
url="https://github.com/bitrise-io/bitrise"
license=('MIT')
provides=('bitrise')
optdepends=('envman' 'stepman')
install=$pkgname.install
source=(${pkgname}-${pkgver}::"${url}/releases/download/${pkgver}/bitrise-Linux-${CARCH}"
        https://raw.githubusercontent.com/bitrise-io/bitrise/master/LICENSE)

package() {
  install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/bitrise"
}

sha256sums=('4c7e024dbbd67825810c826d408765b049dba469aeb2f454fd6f45f8a5f01d38'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
