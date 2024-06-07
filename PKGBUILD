# Maintainer: Alex Tharp <alex at toastercup dot io>
pkgname=crowdin-cli-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://crowdin.github.io/crowdin-cli/"
license=('MIT')
depends=('java-runtime>=8')
provides=("crowdin-cli=${pkgver}")
conflicts=("crowdin-cli")
arch=('x86_64')
_debver=${pkgver%.*}-0
source=("https://artifacts.crowdin.com/repo/deb/crowdin_${_debver}.deb")
sha256sums=('957ef81e2c870edb116cd7d1e5854890030f6be4b8d74710c00819681b1cbcc9')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}/"
}
