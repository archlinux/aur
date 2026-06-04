pkgname=sfptool-bin
pkgver=1.3.10
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.3.10_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.3.10_amd64.deb")
sha256sums=('d6afc6a86119b0785c4367dec0233f154dc8f8cd348e891d99e2d96c2e6f3424')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.3.10_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
