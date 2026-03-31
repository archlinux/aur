pkgname=sfptool-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.0.1_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.0.1_amd64.deb")
sha256sums=('d9d9e2a510ece49f3901ffc03ce61174519d4765ae6c001c7f213984a5514ace')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.0.1_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
