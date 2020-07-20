# Maintainer: scan
pkgname=keepass-plugin-rpc
pkgver=1.11.0
pkgrel=1
pkgdesc="RPC plugin for Keepass"
license=('GPL')
depends=("keepass")
url="https://github.com/kee-org/keepassrpc"
source=(https://github.com/kee-org/keepassrpc/releases/download/v${pkgver}/KeePassRPC.plgx)
arch=(any)
sha256sums=('a48b30a1864ce90717a6173cd7b681e1eebe9e15921932e962037aeac7236584')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Plugins
   install -m644 KeePassRPC.plgx "${pkgdir}"/usr/share/keepass/Plugins
}
