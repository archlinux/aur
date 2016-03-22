pkgname=figa
_gitname=kslf
pkgver=1.1
pkgrel=1
pkgdesc='Che schifo la figa, meglio Linux!'
arch=('i686' 'x86_64' 'arm')
license=('free')
makedepends=('git')
depends=('lsb-release')
provides=('figa')
conflicts=('figa')
source=("git://github.com/crisbal/kslf.git")
md5sums=('SKIP')

package() {
	cd "$_gitname"

	install -Dm 775 figa "$pkgdir/usr/bin/figa"
}
