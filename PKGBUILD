# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
pkgname=crowdin-cli-bin
pkgver=3.1.15
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
arch=('x86_64')

sha256sums=('0fecb7618c1c022db0d2c07b0f43bea3c85652541485a13c1f8b3f6f99a9a53c')

source=(
	"https://artifacts.crowdin.com/repo/rpm/crowdin3.rpm"
)

package()
{
  cd "$srcdir"
	cp -R "$srcdir"/{etc,usr} "$pkgdir"/
}
