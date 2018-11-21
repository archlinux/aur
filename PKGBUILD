# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=compiz-manager
pkgver=0.7.0
pkgrel=2
pkgdesc="Compiz Fusion Starter Program"
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
depends=('compiz-core>=0.8.0')
conflicts=('compiz-manager-git')
source=("https://github.com/compiz-reloaded/compiz-manager/releases/download/v${pkgver}/compiz-manager-${pkgver}.tar.xz")
md5sums=('e684c3334de4d0466fae52e5d63eb199')

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 compiz-manager "${pkgdir}/usr/bin/compiz-manager"
}
