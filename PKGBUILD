pkgname=sfptool-bin
pkgver=1.10.5
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.10.5_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.10.5_amd64.deb")
sha256sums=('9a93be6ba78e8a7e9cc2c97ef8076f4b388fa4948f1542792c0a12db1bdc0718')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.10.5_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
