pkgname=sfptool-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.1.2_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.1.2_amd64.deb")
sha256sums=('cd66253378832a43274d14714e3e66c506b1ed9b4ec28fdc0416ec7caa3d8bdf')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.1.2_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
