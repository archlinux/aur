pkgname=sfptool-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedeps=('binutils')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.4.0_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.4.0_amd64.deb")
sha256sums=('1903f7f073ac492917a758f4d17f24c6628850a4acad2146266f5cd14f63d4fd')

package() {
  cd "$srcdir"
  local data_archive
  ar x "sfp-tool_1.4.0_amd64.deb"
  tar -xvf data.tar.* -C "$pkgdir/"
}
