# Maintainer: SnowyClaw <bowser5543@gmail.com>
pkgname=blws-binaries-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Provides binaries."
arch=('any')
license=('unknown')
source="git://github.com/SnowyClaw/blws-binaries-git.git"
conflicts=('blws-all-in-one-full-git' 'blws-all-in-one-optimised-git')
md5sums=('SKIP')

package() {
	cd "${pkgname}"
	mv * "${pkgdir}"
}