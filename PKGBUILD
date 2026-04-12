pkgname=sfptool-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.1.1_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.1.1_amd64.deb")
sha256sums=('cf0881c5ee022430675b09f1d6297ff9f82459c9e53a49c2b7af4ae7a9bd684d')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.1.1_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
