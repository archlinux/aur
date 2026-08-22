# Maintainer: mzwing <mzwing@mzwing.eu.org>

_pkgname=xwayclip
pkgname=xwayclip-bin
_pkgver=0.2.2
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='Bidirectional clipboard synchronization between X11 and Wayland for poorly implemented apps like Linux QQ'
arch=('x86_64' 'aarch64')
url='https://github.com/so1ve/xwayclip'
license=('MIT')
provides=('xwayclip')
conflicts=('xwayclip' 'xwayclip-git')
source=("LICENSE::$url/raw/v$_pkgver/LICENSE")
source_x86_64=("$_pkgname-x86_64-unknown-linux-gnu::$url/releases/download/v$_pkgver/$_pkgname-x86_64-unknown-linux-gnu")
source_aarch64=("$_pkgname-aarch64-unknown-linux-gnu::$url/releases/download/v$_pkgver/$_pkgname-aarch64-unknown-linux-gnu")
sha256sums=('4d36a113b0a6a584805f0537e0126a382ca425d544c5ae4302b260c56ad42c83')
sha256sums_x86_64=('eb4519bf433cd0ea4785acfae6d45635e75736c71a461cdb308c2903ae13c81a')
sha256sums_aarch64=('93974c7bd21c70a1c2849e7b66ad3d71912da431497e890c85151ebef36ebf9a')

package() {
    install -Dm755 "$_pkgname-$CARCH-unknown-linux-gnu" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
