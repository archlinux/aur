# Maintainer: Alex Tharp <toastercup at gmail dot com>
pkgname=crowdin-cli-bin
pkgver=3.7.7
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
provides=("crowdin-cli=${pkgver}")
conflicts=("crowdin-cli")
arch=('x86_64')

sha256sums=('6e24970ccd20f661df10907f7f5a38b7d8092e1501c8c07c37198c9116a63a08')

source=(
	"https://artifacts.crowdin.com/repo/rpm/crowdin3.rpm"
)

package()
{
  cd "$srcdir"
  cp -R "$srcdir"/{etc,usr} "$pkgdir"/
}
