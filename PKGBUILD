# Maintainer: Damglador <damglador@gmail.com>
# Contributor: Alex Tharp <alex at toastercup dot io>

pkgname=crowdin-cli-bin
pkgver=4.12.0
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://crowdin.github.io/crowdin-cli/"
license=('MIT')
depends=('java-runtime>=8')
provides=("crowdin-cli=${pkgver}")
conflicts=("crowdin-cli")
arch=('x86_64')
_debver="${pkgver%.*}-${pkgver##*.}"
source=("https://artifacts.crowdin.com/repo/deb/crowdin_${_debver}.deb")
sha256sums=('97a7a5728a6c451eadf3950e2c651e0645a8c0ca9fb2a175b554810a31178591')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}/"
}
