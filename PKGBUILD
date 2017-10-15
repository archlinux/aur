# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>
#
# Credits:
#   - Thanks to gamezelda and Magotchi for pointing out that newer versions
#     of the plugin are also hosted on GitHub, which makes downloading the
#     latest version a lot easier.

pkgname=keepass-plugin-rpc
epoch=1
pkgver=1.7.3
_git_tag=1.7.3.1
pkgrel=2
pkgdesc="RPC plugin for Keepass (used by the KeeFox addon for Firefox)"
arch=(any)
url="https://github.com/kee-org/keepassrpc"
license=('GPL')
depends=(keepass)
install="${pkgname}.install"
source=("KeePassRPC-${pkgver}.plgx::https://github.com/kee-org/keepassrpc/releases/download/v${_git_tag}/KeePassRPC.plgx")

package() {
    cd "$srcdir"

    install -m 644 -D "KeePassRPC-${pkgver}.plgx" "${pkgdir}/usr/share/keepass/plugins/KeePassRPC.plgx"
}

sha384sums=('a08e6c433a220ff9ee221dabacd3459f0f14d3911c200e311ba048209d328ca7b81581f6d95a750aa45508bd39bc96c3')
