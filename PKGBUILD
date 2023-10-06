# Maintainer: Zhymabek Roman
pkgname=puffin-internet-terminal
pkgver=8.2.4.705
pkgrel=1
pkgdesc="The wicked fast web browser from CloudMosa Inc."
arch=(x86_64 i686)
url="https://www.puffin.com/"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source_x86_64=("https://download.puffinbrowser.com/repo/pool/stable/amd64/puffin-internet-terminal_${pkgver}_amd64.deb")
source_i686=("https://download.puffinbrowser.com/repo/pool/stable/i386/puffin-internet-terminal_${pkgver}_i386.deb")
sha256sums_x86_64=('14dfad4dc78c7c1e700bee8b02eef7721416417b06b6886b2bb71134b9fd4714')
sha256sums_i686=('54cf2d978bec057b33c56ba9de0a6ab0d8e81127386b1ba97540b701073e0d4e')
validpgpkeys=()

package() {
  cd "$srcdir"
  tar xf data.tar.xz -C "${pkgdir}"
  chmod 755 "${pkgdir}/opt/" "${pkgdir}/usr" "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/appdata"
  rm "${pkgdir}/opt/cloudmosa/puffin/upgrade" "${pkgdir}/opt/cloudmosa/puffin/upgrade_agent"
  ln -s "${pkgdit}"/opt/cloudmosa/puffin/puffin "${pkgdir}"/usr/bin/puffin
}
