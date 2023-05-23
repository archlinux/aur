# Maintainer: Alex Tharp <toastercup at gmail dot com>
pkgname=crowdin-cli-bin
pkgver=3.11.1
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
provides=("crowdin-cli=${pkgver}")
conflicts=("crowdin-cli")
arch=('x86_64')

sha256sums=('492b53a140af7b3ca00b7b4d7353690be23ce2249c444c85f546fb55c0b0ce53')

source=(
	"https://artifacts.crowdin.com/repo/rpm/crowdin3.rpm"
)

package()
{
  cd "$srcdir"
  cp -R "$srcdir"/{etc,usr} "$pkgdir"/
}
