pkgname=sfptool-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.4.1_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.4.1_amd64.deb")
sha256sums=('13312a753cdfe1777af9a900b60afb1b9201e6bc6e595b3e35cea33289e7bc4c')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.4.1_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
