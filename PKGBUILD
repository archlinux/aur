# Maintainer: Kajetan Puchalski <kajetan dot puchalski at tuta dot io>
pkgname=nordvpn-openrc
pkgver=1.0
pkgrel=1
pkgdesc="OpenRC service script for nordvpn-bin"
arch=('any')
url='https://github.com/mrkajetanp/aur/tree/main/nordvpn-openrc'
license=('unknown')
depends=('nordvpn-bin' 'openrc')
optdepends=('wireguard-tools: necessary for NordLynx support')
source=("nordvpnd.initd")
sha256sums=("e86938a27c5da04cc61314fa6b5d9a8016614e059882187abac791331c342b54")

package() {
  install -Dm755 ${srcdir}/nordvpnd.initd "$pkgdir"/etc/init.d/nordvpnd
  install=nordvpnd.install
}
