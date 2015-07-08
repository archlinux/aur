# Maintainer: SnowyClaw <bowser5543@gmail.com>
pkgname=blws-all-in-one-full-git
pkgver=0.0.1
pkgrel=6
pkgdesc="Provides binaries, configuration, and themes."
arch=('any')
license=('unknown')
source="git://github.com/SnowyClaw/blws-all-in-one-full-git.git"
conflicts=('blws-all-in-one-optimised-git' 'blws-binaries-git' 'blws-configuration-full-git' 'blws-configuration-optimised-git')
md5sums=('SKIP')

package() {
	cd "${pkgname}"
	mv * "${pkgdir}"
}