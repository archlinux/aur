# Maintainer: scan
pkgname=keepass-plugin-rpc
pkgver=1.9.0
pkgrel=1
pkgdesc="RPC plugin for Keepass"
license=('GPL')
depends=("keepass")
url="https://github.com/kee-org/keepassrpc"
source=(https://github.com/kee-org/keepassrpc/releases/download/v1.9.0/KeePassRPC.plgx)
arch=(any)
sha256sums=('4b24fc8e47ca70989a7d948397a4707913484027635ad5f8be7f96794cfe0309')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Plugins
   install -m644 KeePassRPC.plgx "${pkgdir}"/usr/share/keepass/Plugins
}
