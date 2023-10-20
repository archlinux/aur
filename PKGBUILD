# Maintainer: Zhymabek Roman
pkgname=puffin-internet-terminal-demo-bin
pkgver=8.2.4.705
pkgrel=2
pkgdesc="The wicked fast web browser from CloudMosa Inc."
arch=('x86_64' 'i686' 'aarch64')
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
source_x86_64=("https://download.puffinbrowser.com/repo/pool/stable/amd64/puffin-internet-terminal-demo_${pkgver}_amd64.deb")
source_i686=("https://download.puffinbrowser.com/repo/pool/stable/i386/puffin-internet-terminal-demo_${pkgver}_i386.deb")
source_aarch64=("https://download.puffinbrowser.com/repo/pool/stable/arm64/puffin-internet-terminal-demo_${pkgver}_arm64.deb")
sha256sums_x86_64=('bc94930c3678c11cd94486fd03d03adcc4e9cea4e440f3b4b26dffd9abc59284')
sha256sums_i686=('f68184307eb7fefc0c620d986673e31b8ca94f195972659a483251189e4d1d1e')
sha256sums_aarch64=('0ba2743ecb1e05407fa06eff9a55afcb6d8010a346b82fbb21515220668e4884')
validpgpkeys=()

package() {
  cd "$srcdir"
  tar xf data.tar.xz -C "${pkgdir}"
  chmod 755 "${pkgdir}/opt/" "${pkgdir}/usr" "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/appdata"
  rm "${pkgdir}/opt/cloudmosa/puffin_demo/upgrade" "${pkgdir}/opt/cloudmosa/puffin_demo/upgrade_agent"
  ln -s "${pkgdit}"/opt/cloudmosa/puffin_demo/puffin_demo "${pkgdir}"/usr/bin/puffin_demo
}
