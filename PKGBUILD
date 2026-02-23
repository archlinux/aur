# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>

pkgname=plymouth-theme-nyancat
pkgver=1.1
pkgrel=1
pkgdesc="Plymouth Theme for Nyancat"
arch=('any')
url="https://github.com/OmegaRogue/Nyan-Plymouth"
license=('All rights reserved')
depends=('plymouth')
install='plymouth-theme-nyancat.install'
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

package() {
	cd $srcdir/$repo
	install -dm755 "$pkgdir/usr/share/plymouth/themes/nyancat"
	cp -r ./Nyan-Plymouth/* "$pkgdir/usr/share/plymouth/themes/nyancat"
}
