# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Jan Rüegg <rggjan@gmail.com>

pkgname=pacfoster
pkgver=0.1
pkgrel=2
pkgdesc="A cleaning script similar to 'debfoster', using the pacman build system."
arch=('i686' 'x86_64')
url="https://bbs.archlinux.org/viewtopic.php?pid=834436"
license=('GPL')
depends=('ruby>=1.9.2' 'pacman>=3.4.1')
optdepends=('pikaur')
source=('pacfoster.rb')
md5sums=('44c0f1a8ebbbe6e606c0793aa3b46fa8')

package()
{
	mkdir -p "${pkgdir}/usr/bin"
	install --mode=755 pacfoster.rb "${pkgdir}/usr/bin/pacfoster"
}
