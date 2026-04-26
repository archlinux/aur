pkgname=myclash
_pkgname=clash-nyanpasu
_reltag=v1.6.0-r1
pkgver=1.6.0
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (qs625 build)"
arch=('x86_64')
url="https://github.com/qs625/clash"
license=('GPL3')
options=('!strip' '!debug')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'mihomo')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-appimage' 'clash-nyanpasu' 'clash-nyanpasu-bin' 'clash-nyanpasu-qs-bin')
provides=('clash-nyanpasu')
optdepends=('clash-rs: custom protocol network proxy, coding with rust')
source=("${_pkgname}-${pkgver}-x86_64.deb::https://github.com/qs625/clash/releases/download/${_reltag}/Clash.Nyanpasu_${pkgver}_amd64.deb")
sha256sums=('f4314589d8d3d173ad3647c5333811421416065124d2b806dd08858a35c29524')

package() {
	tar xpf data.tar.gz -C "${pkgdir}"
	rm -f "${pkgdir}/usr/bin/clash"
	rm -f "${pkgdir}/usr/bin/mihomo"
	rm -f "${pkgdir}/usr/bin/clash-rs"
	rm -f "${pkgdir}/usr/bin/mihomo-alpha"
}