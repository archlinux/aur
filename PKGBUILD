# Maintainer: Alex Tharp <toastercup at gmail dot com>
pkgname=crowdin-cli-bin
pkgver=3.7.8
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
provides=("crowdin-cli=${pkgver}")
conflicts=("crowdin-cli")
arch=('x86_64')

sha256sums=('bed2b251ae26aef10fbfe6f49048544058a3b36c9e6ef0446809e2ca95a645cc')

source=(
	"https://artifacts.crowdin.com/repo/rpm/crowdin3.rpm"
)

package()
{
  cd "$srcdir"
  cp -R "$srcdir"/{etc,usr} "$pkgdir"/
}
