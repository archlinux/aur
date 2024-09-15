# Maintainer: Alex Tharp <alex at toastercup dot io>
pkgname=crowdin-cli-bin
pkgver=4.1.2
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
sha256sums=('f86eb811505eb34f3c33468a523a4643b0437c7c0cc8182e1d83369ef5eaa40b')

package() {
  tar -xvf data.tar.xz -C "${pkgdir}/"
}
