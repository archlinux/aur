# Maintainer: Alex Tharp <alex at toastercup dot io>
pkgname=crowdin-cli-bin
pkgver=4.1.1
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
sha256sums=('1f6b4e67a724f659279f276b7cd6761ebc3ad3fa1a3eb6e394ded7bca5418705')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}/"
}
