# Maintainer: Alex Tharp <alex at toastercup dot io>
pkgname=crowdin-cli-bin
pkgver=3.19.4
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
provides=("crowdin-cli=${pkgver}")
conflicts=("crowdin-cli")
arch=('x86_64')
source=("https://artifacts.crowdin.com/repo/rpm/crowdin3.rpm")
sha256sums=('88ea640d90d7be30f799fe222e53adb659b29abc1282f79b9f475be356fb30aa')

package() {
  cd "$srcdir"
  cp -R "$srcdir"/{etc,usr} "$pkgdir"/
}
