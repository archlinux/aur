# Maintainer: scan
pkgname=keepass-plugin-rpc
pkgver=2.0.2
pkgrel=1
pkgdesc="RPC plugin for Keepass"
license=('GPL')
depends=("keepass>=2.57")
url="https://github.com/kee-org/keepassrpc"
source=(https://github.com/kee-org/keepassrpc/releases/download/v${pkgver}/KeePassRPC.plgx)
arch=(any)
sha256sums=('fad2fa6f502b9b6624385c952bfe9d5f18077c843e855e738b34a88d5b6fc67e')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Plugins
   install -m644 KeePassRPC.plgx "${pkgdir}"/usr/share/keepass/Plugins
}
