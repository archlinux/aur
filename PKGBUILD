# Maintainer: w568w <w568w at outlook dot com>

_pkgname='lark-cli'
pkgname="$_pkgname-bin"
pkgver='1.0.98'
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
sha256sums_x86_64=('4a12dcb7a0aab25986d8bcd046cb45b08278531a9aac3a12b53cf3d94738fe80')
sha256sums_aarch64=('f798b26ce4b369d70411945e7f66bbe4382c411bc47d81950a662de7b69b41ed')

package() {
  install -Dm755 lark-cli -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
