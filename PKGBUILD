# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=emerald-legacy-launcher-bin
pkgver=1.6.1
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
sha256sums=('38e85ee8d9e598694d48617a27d2f68da9b4fc075d45885576c8b836416699fd')

package() {
  cd "$srcdir"
  tar -xvf ${srcdir}/data.tar.gz -C ${pkgdir}
}
