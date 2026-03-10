pkgname=lazyff-bin
pkgver=0.1.3_test
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Interactive TUI wrapper around ffmpeg for media operations"
arch=('x86_64' 'aarch64')
url='https://github.com/Manas-Kenge/lazyff'
license=('MIT')
depends=('ffmpeg' 'glibc')
provides=('lazyff')
conflicts=('lazyff')
source=("LICENSE::https://raw.githubusercontent.com/Manas-Kenge/lazyff/v${_pkgver}/LICENSE")
source_x86_64=("lazyff-${_pkgver}-x86_64.tar.gz::https://github.com/Manas-Kenge/lazyff/releases/download/v${_pkgver}/lazyff-linux-x64.tar.gz")
source_aarch64=("lazyff-${_pkgver}-aarch64.tar.gz::https://github.com/Manas-Kenge/lazyff/releases/download/v${_pkgver}/lazyff-linux-arm64.tar.gz")
sha256sums=('997473d4ea92fed39e3bf27fc10eb9ac55ad49a2e2ddf4eb5d0b6ce93aa12b33')
sha256sums_x86_64=('40b505b268ba3c0b8a9f1bb565ab498ca15dbc45a29ed183af8fc95bb85e6441')
sha256sums_aarch64=('964fa74b480b93ea61a592108970122c84993e6bda5d0b2a4630d4477fe2a8be')

package() {
  install -Dm755 "lazyff" "$pkgdir/usr/bin/lazyff"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
