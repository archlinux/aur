# Maintainer: scan
pkgname=keepass-plugin-rpc
pkgver=1.12.1
pkgrel=1
pkgdesc="RPC plugin for Keepass"
license=('GPL')
depends=("keepass")
url="https://github.com/kee-org/keepassrpc"
source=(https://github.com/kee-org/keepassrpc/releases/download/v${pkgver}/KeePassRPC.plgx)
arch=(any)
sha256sums=('73468bcb57472ca6d17e45294136e4d2a4e69ac19e500225f71deab6ad3f1a5e')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Plugins
   install -m644 KeePassRPC.plgx "${pkgdir}"/usr/share/keepass/Plugins
}
