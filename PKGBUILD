# Maintainer: Omni LLC <team@omni.dev>
pkgname=omnidotdev-eden-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Developer onboarding preflight checks (pre-built)"
arch=('x86_64')
url="https://eden.omni.dev"
license=('MIT')
depends=()
provides=('omnidotdev-eden')
conflicts=('omnidotdev-eden')
source=("https://github.com/omnidotdev/eden-cli/releases/download/v$pkgver/eden-x86_64-unknown-linux-gnu.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/omnidotdev/eden-cli/v$pkgver/LICENSE.md")
sha256sums=('SKIP'
            'f6d51cfddf65fd0c0c60882e14d5d3a6621e58634e6ef4d59a1a48bc23f243fd')

package() {
  install -Dm755 "eden" "$pkgdir/usr/bin/eden"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
