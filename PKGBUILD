# Maintainer: Damglador <vse.stopchanskyi at gmail dot com>
# Contributor: Alex Tharp <alex at toastercup dot io>

pkgname=crowdin-cli-bin
pkgver=4.11.0
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
sha256sums=('3369540ad1f3a87262f7fe90926105186ab47eeb2f5a602d16f63614ff741d3d')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}/"
}
