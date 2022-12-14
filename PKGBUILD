# Maintainer: Ben Mitchell (bjosephmitchell@gmail.com)
pkgname=muse-hub-bin
pkgver=1.0.0.392
pkgrel=1
pkgdesc="Manage MuseScore Libraries."
arch=('x86_64')
url=""
provides=("muse-hub")
license=()
groups=()
depends=()
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://pub-c7a32e5b5d834ec9aeef400105452a42.r2.dev/Muse_Hub.deb" "muse-hub.service" "muse-hub.desktop")
sha512sums=(
	'8c3b145d4350e70d75548ee174331ff6bbf022cfc0dfd338828c62e99a860fed37254c55b75ac10d0e3f4475dd93e79de22a52fb6fdb5ad78d8b86de9f50f836'
	'52282b6cea0564173a20c922b5c71044d807506431f38457e0df419ca0ac6978004076e4e4985befbbe2481c6a49f3a45722970397918088fda63af1cf9c3c73'
	'e880ed5b5c7c2f7fa78d9a3f4cb3e438b7dc1321c6e2470644d9f0ff96fe060dd34640ab0da1349d004c65179cd9b89790242a77b09adf03e5178be63d59817d'
)

package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	install -Dm644 muse-hub.service "${pkgdir}/usr/lib/systemd/system/muse-hub.service"
	install -Dm644 muse-hub.desktop "${pkgdir}/usr/share/applications/muse-hub.desktop"
}
