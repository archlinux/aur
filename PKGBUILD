# Maintainer: Alex Tharp <toastercup at gmail dot com>
pkgname=crowdin-cli-bin
pkgver=3.9.1
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
provides=("crowdin-cli=${pkgver}")
conflicts=("crowdin-cli")
arch=('x86_64')

sha256sums=('9f7d62fed14c2e871833a92c8e12e23d03b6d012b71aff7970ecea7442c9780e')

source=(
	"https://artifacts.crowdin.com/repo/rpm/crowdin3.rpm"
)

package()
{
  cd "$srcdir"
  cp -R "$srcdir"/{etc,usr} "$pkgdir"/
}
