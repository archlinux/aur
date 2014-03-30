# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Jan Rüegg <rggjan@gmail.com>

pkgname=pacfoster
pkgver=0.1
pkgrel=1
pkgdesc="A cleaning script similar to 'debfoster', using the pacman build system."
arch=('i686' 'x86_64')
url="https://bbs.archlinux.org/viewtopic.php?pid=834436"
license=('GPL')
depends=('ruby>=1.9.2' 'pacman>=3.4.1' 'yaourt>=0.9.4.3')
source=('pacfoster.rb')
md5sums=('55fbd689083fe2afcda4f103ab7f2a90')

package()
{
	mkdir -p "${pkgdir}/usr/bin"
	install --mode=755 pacfoster.rb "${pkgdir}/usr/bin/pacfoster"
}
