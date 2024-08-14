# Maintainer: himi <himi888@outlook.com>
pkgname=xterminal-deb
_pkgname=xterminal
pkgver=1.31.4
pkgrel=1
pkgdesc="SSH和RDP Windows客户端（使用内置electron）"
arch=('x86_64')
url="https://www.xterminal.cn/"
license=('custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("xterminal-bin" "xterminal")
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${_pkgname}.install
source_x86_64=("https://cdn-cn.xterminal.cn/downloads/XTerminal-${pkgver}-linux-amd64.deb")
sha512sums_x86_64=('789604eb52e98f7b85b39c703c0cb7e4801cdcb652135ee070efef2d73ba4170ca98b80603c760b0810dde9c00b88016c63dede39e129eadc87cc150e6623e0b')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package(){

	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
