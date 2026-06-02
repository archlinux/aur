# Maintainer: w568w <w568w at outlook dot com>

_pkgname='lark-cli'
pkgname="$_pkgname-bin"
pkgver='1.0.45'
pkgrel='1'
pkgdesc='The official CLI for Lark/Feishu open platform'
arch=('x86_64' 'aarch64')
url='https://github.com/larksuite/cli'
license=('MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("LICENSE::$url/raw/refs/heads/main/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/lark-cli-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/lark-cli-$pkgver-linux-arm64.tar.gz")

sha256sums=('c969fc7e3af68e6bf40b0d8dd9c3dcc377eb685a2139535b203b39fdcad739ee')
sha256sums_x86_64=('12d43b72a2751dd52091b97ea808b0db12fd01fcfdc585620149329eca43c819')
sha256sums_aarch64=('b493b288c3bb261401f42c8e2b55d65ac65a4168fc5278a19c9ed992bef50010')

package() {
  install -Dm755 lark-cli -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
