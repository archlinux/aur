pkgname=pirate-radio-launcher
pkgver=0.12.1
pkgrel=1
pkgdesc="A launcher for Knockout City's Private Server Edition"
arch=('x86_64')
url="https://github.com/KnockoutCity-Pirate-Radio/PirateRadio-Artifacts"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/launcher-v${pkgver}/Pirate.Radio.Launcher_${pkgver}_amd64.deb")
sha256sums_x86_64=('4f5d1686c143380bace8bb376de69e4ae07f0aba7ec01be116d0b7d3e495b33d')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
