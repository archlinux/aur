# Maintainer: w568w <w568w at outlook dot com>

_pkgname='lark-cli'
pkgname="$_pkgname-bin"
pkgver='1.0.85'
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
sha256sums_x86_64=('78767460e6c8bb9811d9f28e8df7cd2721b14fdceb5b65ba42bf43e448c4bb78')
sha256sums_aarch64=('b05ba05908dc711c3fb0f50cfd235072dfb04a3f23bb39d2f6e0ae2a496b8f16')

package() {
  install -Dm755 lark-cli -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
