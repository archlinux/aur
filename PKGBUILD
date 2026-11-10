pkgname=sfptool-bin
pkgver=1.10.1
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.10.1_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.10.1_amd64.deb")
sha256sums=('0665327e6ee4c152a0ef4d7dde614699db7ff9b116e2f8ef992f1bdaabcdba99')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.10.1_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
