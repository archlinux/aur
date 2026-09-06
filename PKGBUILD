pkgname=sfptool-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.4.3_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.4.3_amd64.deb")
sha256sums=('5e91f9474e721fe76320a8f4bd9b671a23d575ca5605c3d5c2d18482667b03ed')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.4.3_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
