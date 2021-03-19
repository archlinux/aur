# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Jan Rüegg <rggjan@gmail.com>

pkgname=pacfoster
pkgver=0.1
pkgrel=1
pkgdesc="A cleaning script similar to 'debfoster', using the pacman build system."
arch=('i686' 'x86_64')
url="https://bbs.archlinux.org/viewtopic.php?pid=834436"
license=('GPL')
depends=('ruby>=1.9.2' 'pacman>=3.4.1' 'pikaur')
source=('pacfoster.rb')
md5sums=('1d8ce2067d5831b408e9012607bb227e')

package()
{
	mkdir -p "${pkgdir}/usr/bin"
	install --mode=755 pacfoster.rb "${pkgdir}/usr/bin/pacfoster"
}
