# Maintainer: Daniele Basso <d dot bass05 at proton dot me>

pkgname='corepacker'
pkgver=0.0.0
pkgrel=6
pkgdesc='Remove npm, yarn and pnpm using corepack'
arch=('any')
url='https://github.com/nodejs/corepack/'
license=('')
provides=("npm" "yarn" "pnpm" "node-gyp" "nodejs-nopt")
conflicts=("npm" "yarn" "pnpm")
depends=("nodejs")

package() {
	install -dm 755 $pkgdir/usr/bin
	/bin/corepack enable --install-directory $pkgdir/usr/bin
	/bin/corepack enable --install-directory $pkgdir/usr/bin npm
}
