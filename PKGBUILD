# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-run-cli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Self-hosting made simple (pre-built)"
arch=('x86_64')
url="https://run.omni.dev"
license=('Apache-2.0')
depends=()
provides=('omnidotdev-run-cli')
conflicts=('omnidotdev-run-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omnidotdev/run-cli/releases/download/v$pkgver/run-x86_64-unknown-linux-gnu.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/omnidotdev/run-cli/v$pkgver/LICENSE.md")

package() {
  install -Dm755 "run" "$pkgdir/usr/bin/run"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('5889e329b6d16e5e7b89d1b6aec8ba686d47a5ac9b2418875bbeb121c58e955d'
            '64d90764a9baac9d5f0797d6d9a7dfb26823396df09c872557e971cf76cc0a92')
