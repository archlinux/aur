pkgname=sfptool-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.5.0_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.5.0_amd64.deb")
sha256sums=('1bdb00de009bab2174ce4c784757ad2791aa188315fdbb54951c02bf3d515915')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.5.0_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
