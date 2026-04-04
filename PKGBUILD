pkgname=sfptool-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.1.0_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.1.0_amd64.deb")
sha256sums=('7e2b41ce1658f6847e98fe113fcf416e4baf9aa90190db196b1954f2a08a6ac4')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.1.0_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
