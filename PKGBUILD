pkgname=sfptool-bin
pkgver=1.8.2
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.8.2_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.8.2_amd64.deb")
sha256sums=('caf6b85a6663afa2a631101fd29b90114646e3a466aa7ef6c2a43bf59ca4ef33')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.8.2_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
