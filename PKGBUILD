# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
pkgname=crowdin-cli-bin
pkgver=3.2.1
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
provides=("crowdin-cli=${pkgver}")
conflicts=("crowdin-cli")
arch=('x86_64')

sha256sums=('f70e9260c7dcfcf77a5a8da8f623b7de7b86dd4aa6fb54608462c5193de461cc')

source=(
	"https://artifacts.crowdin.com/repo/rpm/crowdin3.rpm"
)

package()
{
  cd "$srcdir"
  cp -R "$srcdir"/{etc,usr} "$pkgdir"/
}
