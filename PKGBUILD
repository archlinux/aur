# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=emerald-legacy-launcher-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="FOSS, cross-platform launcher for Minecraft Legacy Console Edition"
arch=(x86_64)
url="https://github.com/LCE-Hub/LCE-Emerald-Launcher"
license=('GPL-3.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
source=("https://github.com/LCE-Hub/LCE-Emerald-Launcher/releases/download/v${pkgver}/LCE.Emerald.Launcher_${pkgver}_amd64.deb")
sha256sums=('e868b540ecbcdb92333bf169c138aeddaa06cda6563b8752e30c9251a6416807')

package() {
  cd "$srcdir"
  tar -xvf ${srcdir}/data.tar.gz -C ${pkgdir}
}
