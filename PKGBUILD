pkgname=sfptool-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.6.0_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.6.0_amd64.deb")
sha256sums=('90f81a757fa91a94915170fdb6a01136110e5864d3755f6b177f16b35b15fc75')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.6.0_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
