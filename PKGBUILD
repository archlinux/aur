# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>
#
# Credits:
#   - Thanks to gamezelda and Magotchi for pointing out that newer versions
#     of the plugin are also hosted on GitHub, which makes downloading the
#     latest version a lot easier.

pkgname=keepass-plugin-rpc
epoch=1
pkgver=1.8.0
_git_tag=1.8.0
pkgrel=1
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

sha256sums=('8d9d5e390fc4a3b8d6d8f24dd26a712dc032c4ff49708c8ec32c95a2e27594b5')
