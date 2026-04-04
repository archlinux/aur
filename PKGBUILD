pkgname=sfptool-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.0.2_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.0.2_amd64.deb")
sha256sums=('e9c34353995c7a32a3d70c30c7bd313e5a04c3211ae7aae21f31080b877539f8')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.0.2_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
