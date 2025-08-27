# Maintainer: Damglador <vse.stopchanskyi at gmail dot com>
# Contributor: Alex Tharp <alex at toastercup dot io>

pkgname=crowdin-cli-bin
pkgver=4.10.0
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
sha256sums=('67e9d12e9ecf823c18d2eb08fa4052a837927fe550187b2f87f34ae750277b6a')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}/"
}
