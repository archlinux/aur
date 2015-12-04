# Maintainer: Chrysostomus @forum.manjaro.org

pkgname=pacli
pkgver=0.5
pkgrel=1
pkgdesc="An interactive pacman interface using pmenu and bash"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=MIT
depends=('bash'
	'downgrade'
	'pacman'
	'pmenu'
	'sudo'
	'yaourt')
makedepends=('git')
source=("git://github.com/Manjaro-Pek/$pkgname")
md5sums=('SKIP')

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/$pkgname/pacli" "$pkgdir/usr/bin/pacli"
}