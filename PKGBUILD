# Maintainer: Microoo <hu@microoo.net>
pkgname=substratumnode-cli
pkgver=0.4.1
pkgrel=1
pkgdesc="Command line binary of SubstratumNode. SubstratumNode is the foundation of the decentralized SubstratumNetwork. SubstratumNodes work together to relay CORES packages and content on the network."
arch=('x86_64')
url="https://substratum.net"
license=('GPLv3')
depends=()
conflicts=('substratumnode-cli-git')
options=('!strip' '!emptydirs')
source=("https://s3.us-east-2.amazonaws.com/substratum-website-downloads/v0.4.1/SubstratumNode-v0.4.1-Linux64-binary.zip")
sha256sums=('9cbb7c984936e91b58d0330a1d2136def33755a4408c51ea33694540192b2cb4')

package(){
    install -Dm755 SubstratumNode "$pkgdir/usr/bin/SubstratumNode"
    install -Dm755 dns_utility "$pkgdir/usr/bin/dns_utility"
}
