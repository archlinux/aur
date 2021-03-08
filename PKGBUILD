# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
pkgname=crowdin-cli-bin
pkgver=3.5.4
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
provides=("crowdin-cli=${pkgver}")
conflicts=("crowdin-cli")
arch=('x86_64')

sha256sums=('db442cca7719aeba262f5d1ebd600517cc7d2a4ffb2cc68bdf79a74522d56aa5')

source=(
	"https://artifacts.crowdin.com/repo/rpm/crowdin3.rpm"
)

package()
{
  cd "$srcdir"
  cp -R "$srcdir"/{etc,usr} "$pkgdir"/
}
