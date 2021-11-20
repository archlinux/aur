# Maintainer: Topik topik@topik.tech
pkgname=windscribe
pkgver=2.3.11_beta
pkgrel=1
pkgdesc="A port of Windscribe's GUI desktop client"
arch=('x86_64')
url="https://github.com/Windscribe/desktop-v2"
license=('GPL-2.0')
depends=('bash' 'iptables' 'curl' 'icu67-bin')
install=${pkgname}.install
# I had to comment these out because I had unofficial binaries as a source (there aren't any official binaries available yet), and that's apparently not allowed on the AUR (sorry, didn't know)
# You can uncomment the lines below and download the PKGBUILD to get a working installation

#source=("https://github.com/topik0/windscribe-desktop-v2-aur/releases/download/v2.3.11_beta/windscribe_2.3.11_beta_amd64.deb")
#sha512sums=('88e22c070dc5e35ea5fbea0d988dd2b501942193434efe462357363976e404ef3348aad2a2cd8609d8b42dd87a72166d75b2876369d3f1e320eeac4e2974faab')

package() {
	echo
	# tar xf data.tar.xz -C "${pkgdir}"
	# mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
	# curl https://raw.githubusercontent.com/Windscribe/desktop-v2/master/LICENSE --output LICENSE
	# install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}