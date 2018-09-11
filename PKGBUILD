# Maintainer: Microoo <hu@microoo.net>
pkgname=substratumnode-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="Command line binary of SubstratumNode. SubstratumNode is the foundation of the decentralized SubstratumNetwork. SubstratumNodes work together to relay CORES packages and content on the network."
arch=('x86_64')
url="https://substratum.net"
license=('GPLv3')
depends=()
conflicts=('substratumnode-cli-git')
options=('!strip' '!emptydirs')
source=("https://s3.us-east-2.amazonaws.com/substratum-website-downloads/v0.4.0/SubstratumNode-v0.4.0-Linux64-binary.zip")
sha256sums=('8c7e1de7cd3936c155aa61f8363da039520833b987be68be55c0f1c6dc12e31d')

package(){
    install -Dm755 SubstratumNode "$pkgdir/usr/bin/SubstratumNode"
    install -Dm755 dns_utility "$pkgdir/usr/bin/dns_utility"
}
