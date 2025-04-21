# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: ihipop <ihipop at gmail dot com>
_pkgname=warp-terminal
pkgname="${_pkgname}-bin"
pkgver=0.2025.04.16.08.11.stable.02
_pkgver=0.2025.04.16.08.11.stable_02
pkgrel=1
pkgdesc="Warp is the intelligent terminal with AI and your dev team's knowledge built-in."
arch=('x86_64' 'aarch64')
url="https://warp.dev"
license=('custom:WARP')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
depends=()
source=("LICENSE.txt")
source_x86_64=("${_pkgname}-${pkgver}-_amd64.deb::https://releases.warp.dev/stable/v${_pkgver}/warp-terminal_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-_arm64.deb::https://releases.warp.dev/stable/v${_pkgver}/warp-terminal_${pkgver}_arm64.deb")







sha256sums=('1057b326e587edf2f81dc35c6c9cdd2e63d9af1c68e331d7ac8a4bc22ff9de49')
sha256sums_x86_64=('e54858c6f6b51846667550b3d466082aa45d1fb5b409a85bffe794e89e7c72d0')
sha256sums_aarch64=('ec969c6f303ac27630cc0df05cac4fb5b55ff6ffb9e5e114a966eda7d177972e')

        package() {
	tar xf data.tar.xz -C "${pkgdir}"
	#install -d "${pkgdir}/opt/warpdotdev/${_pkgname}"
	cd $pkgdir
	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/opt/$_pkgname"
  ln -s "/opt/warpdotdev/$_pkgname/warp" "$pkgdir/usr/bin/$_pkgname"

}
