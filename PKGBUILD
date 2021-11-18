# Maintainer: Topik topik@topik.tech
pkgname=windscribe
pkgver=2.3.11_beta
pkgrel=1
pkgdesc="A port of Windscribe's desktop client"
arch=('x86_64')
url="https://github.com/Windscribe/desktop-v2"
license=('GPL-2.0')
depends=('bash' 'iptables')
install=${pkgname}.install
source=("https://github.com/topik0/windscribe-desktop-v2-aur/releases/download/v2.3.11_beta/windscribe_2.3.11_beta_amd64.deb")
sha512sums=('88e22c070dc5e35ea5fbea0d988dd2b501942193434efe462357363976e404ef3348aad2a2cd8609d8b42dd87a72166d75b2876369d3f1e320eeac4e2974faab')

package() {
	tar xf data.tar.xz -C "${pkgdir}"
}
