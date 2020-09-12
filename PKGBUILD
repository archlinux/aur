# Maintainer: scan
pkgname=keepass-plugin-rpc
pkgver=1.14.0
pkgrel=1
pkgdesc="RPC plugin for Keepass"
license=('GPL')
depends=("keepass")
url="https://github.com/kee-org/keepassrpc"
source=(https://github.com/kee-org/keepassrpc/releases/download/v${pkgver}/KeePassRPC.plgx)
arch=(any)
sha256sums=('1c410cc93c0252e7cfdb02507b8172c13e18d12c97f08630b721d897dc9b8b24')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Plugins
   install -m644 KeePassRPC.plgx "${pkgdir}"/usr/share/keepass/Plugins
}
