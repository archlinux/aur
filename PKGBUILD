# Maintainer: hawkeye116477 <hawkeye116477 at gmail.com>
pkgname=crowdin-cli-bin
pkgver=2.0.31
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=7')
arch=('x86_64')

sha256sums=('3b73250615f6c8035202af43388eeae9deb646af64c2ecaf83ba2e73ab8308e1')

source=(
	"https://artifacts.crowdin.com/repo/rpm/crowdin.rpm"
)

package()
{
  cd "$srcdir"
  install -d "$pkgdir"/usr/bin
	cp -R "$srcdir"/usr "$pkgdir"/
}
