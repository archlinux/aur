# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-harmony-cli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Templating and syncing engine for project files (pre-built)"
arch=('x86_64')
url="https://harmony.omni.dev"
license=('Apache-2.0')
depends=()
provides=('omnidotdev-harmony-cli')
conflicts=('omnidotdev-harmony-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omnidotdev/harmony-cli/releases/download/v$pkgver/harmony-x86_64-unknown-linux-gnu.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/omnidotdev/harmony-cli/v$pkgver/LICENSE.md")

package() {
  install -Dm755 "harmony" "$pkgdir/usr/bin/harmony"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
