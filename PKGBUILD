pkgname=sfptool-bin
pkgver=1.3.11
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.3.11_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.3.11_amd64.deb")
sha256sums=('5905eac0b4c19ec1cdf9b69847b3dd76611e58ded647d3b2638ab7afe298a0fc')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.3.11_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
