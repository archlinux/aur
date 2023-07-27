# Maintainer: Daniele Basso <d dot bass05 at proton dot me>

pkgname='corepacker'
pkgver=0.0.0
pkgrel=4
pkgdesc='Remove npm, yarn and pnpm using corepack'
arch=('any')
url='https://github.com/nodejs/corepack/'
license=('')
source=("corepacker-remove.hook")
sha512sums=('184b424170e92909dec259d0a4885f0e76c2bf354303a08c67e7d4533ba25fa14918fe0eaf31ac62895b791da4e9945039a17ea6b2e194d7f2fe78940a154f74')
provides=("npm" "yarn" "pnpm")
conflicts=("npm" "yarn" "pnpm")
depends=("nodejs")

package() {
	install -dm 755 $pkgdir/usr/bin
	/bin/corepack enable --install-directory $pkgdir/usr/bin
	/bin/corepack enable --install-directory $pkgdir/usr/bin npm
}
