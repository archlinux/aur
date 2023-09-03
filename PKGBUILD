# Maintainer: Kingtous <me@kingtous.cn>
pkgname=fclash
pkgver=1.4.2
pkgrel=1
epoch=
pkgdesc="A Clash Proxy Fronted based on Clash"
arch=('x86_64')
url="https://github.com/fclash/fclash"
license=('GPL-3.0')
groups=()
depends=('libayatana-appindicator')
makedepends=(dpkg)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Fclash/Fclash/releases/download/v1.4.2/cn.kingtous.fclash-1.4.2-x86_64.deb")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()


build() {
    # Download prebuilt deb package
    bsdtar -xf cn.kingtous.fclash-1.4.2-x86_64.deb
    tar -xf data.tar.xz
}


package() {
    cp -r "${srcdir}/opt"  "${pkgdir}/opt"
	install -Dm0755 "${pkgdir}/opt/apps/cn.kingtous.fclash/entries/applications/cn.kingtous.fclash.desktop" "${pkgdir}/usr/share/applications/cn.kingtous.fclash.desktop"
}
