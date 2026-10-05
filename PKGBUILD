pkgname=sfptool-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.6.2_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.6.2_amd64.deb")
sha256sums=('de1aa19a827ac35c7909c13a6c81e2e2eff6d5806a8c4bd0f82b49ff0da25305')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.6.2_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
