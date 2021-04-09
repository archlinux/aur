# Maintainer: TechieDamien <damien@techiedamien.xyz>
pkgname=i3-utils
pkgver=1.0.1
pkgrel=1
pkgdesc="A bunch of scripts to make using i3 easier."
arch=('any')
url="https://github.com/tasinet/i3-utils"
license=('unknown')
depends=('jq')
makedepends=('git')
source=("git+https://github.com/tasinet/i3-utils.git")
md5sums=(SKIP)

#pkgver() {
#        cd "$pkgname"
#        git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

package() {
	cd "$pkgname"
        mkdir -p "$pkgdir/usr/bin/"
	install *.sh "$pkgdir/usr/bin/"
}
