pkgname=sfptool-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.2.0_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.2.0_amd64.deb")
sha256sums=('b43a608e9ae8cf3213353fbc113c8025a9f5f84149faf0ba95e1986b12c4b7ba')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.2.0_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
