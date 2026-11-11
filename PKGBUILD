pkgname=sfptool-bin
pkgver=1.10.2
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.10.2_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.10.2_amd64.deb")
sha256sums=('4a3514f617a4e424a4c783eaebcc53f48fae3047acf47e404062087d874e5a4a')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.10.2_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
