# Maintainer: Microoo <hu _AT_ m i c r o o o _DOT_ net>
pkgname=substratumnode-cli
pkgver=0.4.3
pkgrel=1
pkgdesc="Command line binary of SubstratumNode. SubstratumNode is the foundation of the decentralized SubstratumNetwork. SubstratumNodes work together to relay CORES packages and content on the network."
arch=('x86_64')
url="https://substratum.net"
license=('GPLv3')
depends=()
conflicts=('substratumnode-cli-git')
options=('!strip' '!emptydirs')
source=("https://s3.us-east-2.amazonaws.com/substratum-website-downloads/v{pkgver}/SubstratumNode-v{pkgver}-Linux64-binary.zip")
sha256sums=('b3fc664bf0ab5e29b6436070aac50b9ab8d796a7c7deef22c31f2486570a4d63')

package(){
    install -Dm755 SubstratumNode "$pkgdir/usr/bin/SubstratumNode"
    install -Dm755 dns_utility "$pkgdir/usr/bin/dns_utility"
}
