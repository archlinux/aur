# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
pkgname=crowdin-cli-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
arch=('x86_64')

sha256sums=('771562c367a97bcccfbba1c66c71e90696589c9830df077e252496e0da64ea42')

source=(
	"https://artifacts.crowdin.com/repo/rpm/crowdin3.rpm"
)

package()
{
  cd "$srcdir"
	cp -R "$srcdir"/{etc,usr} "$pkgdir"/
}
