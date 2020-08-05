# Maintainer: scan
pkgname=keepass-plugin-rpc
pkgver=1.13.0
pkgrel=1
pkgdesc="RPC plugin for Keepass"
license=('GPL')
depends=("keepass")
url="https://github.com/kee-org/keepassrpc"
source=(https://github.com/kee-org/keepassrpc/releases/download/v${pkgver}/KeePassRPC.plgx)
arch=(any)
sha256sums=('a2ec4c388ba33265136a034b328e0ecef5e4f3c0c33596f4bef43349920a4c87')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Plugins
   install -m644 KeePassRPC.plgx "${pkgdir}"/usr/share/keepass/Plugins
}
