# Maintainers: Götz
# Contributors: Jni <jni.viens at protonmail dot com>
pkgname=bitrise
pkgver=2.10.1
pkgrel=1
pkgdesc="Run your bitrise.io automations offline"
arch=('x86_64')
url="https://github.com/bitrise-io/bitrise"
license=('MIT')
provides=('bitrise')
optdepends=('envman' 'stepman')
install=$pkgname.install
source=(
  ${pkgname}-${pkgver}::"${url}/releases/download/${pkgver}/bitrise-Linux-${CARCH}"
  https://raw.githubusercontent.com/bitrise-io/bitrise/master/LICENSE
)

package() {
  install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/bitrise"
}

sha256sums=('1940aa718f2a108c67e0822152accda699a4adf7ca7b7f5309f7104fc760a5cf'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
