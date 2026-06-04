pkgname=sfptool-bin
pkgver=1.3.5
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.3.5_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.3.5_amd64.deb")
sha256sums=('808d592f637382ee3961ac202caa2461c410ea2a90ea18c23b27aec2120c4e0b')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.3.5_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
