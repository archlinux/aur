# Maintainer: Microoo <hu@microoo.net>
pkgname=substratumnode-cli
pkgver=0.4.2
pkgrel=1
pkgdesc="Command line binary of SubstratumNode. SubstratumNode is the foundation of the decentralized SubstratumNetwork. SubstratumNodes work together to relay CORES packages and content on the network."
arch=('x86_64')
url="https://substratum.net"
license=('GPLv3')
depends=()
conflicts=('substratumnode-cli-git')
options=('!strip' '!emptydirs')
source=("https://s3.us-east-2.amazonaws.com/substratum-website-downloads/v0.4.2/SubstratumNode-v0.4.2-Linux64-binary.zip")
sha256sums=('232e14691f48ba064799501991b7c8a7aa5f76ebbee44f3db2b785797dea3e83')

package(){
    install -Dm755 SubstratumNode "$pkgdir/usr/bin/SubstratumNode"
    install -Dm755 dns_utility "$pkgdir/usr/bin/dns_utility"
}
