pkgname=sfptool-bin
pkgver=1.3.13
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.3.13_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.3.13_amd64.deb")
sha256sums=('247665d328bcaad8509383368edf4b2def53150216949690199f0af9e09065d1')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.3.13_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
