# Maintainer: Arfad <arfadmuzali258@gmail.com>
pkgname=restui-bin
pkgbase=restui-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="Terminal UI API client for testing HTTP requests (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/arfadmuzali/restui"
license=('MIT')
depends=('glibc')
provides=('restui')
conflicts=('restui')

# gunakan binary release dari GitHub
source=(
  "restui::https://github.com/arfadmuzali/restui/releases/download/v$pkgver/restui_Linux_x86_64.tar.gz"
)
sha256sums=('2b1779b93d668259f7c36d811aac90b98ab3e8a264af232d96c16ddc8ee0f6d8')

package() {
  install -Dm755 restui "$pkgdir/usr/bin/restui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/restui-bin/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

