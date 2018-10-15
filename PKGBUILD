# Maintainer: Andreas Louv <andreas@louv.dk>

pkgname=rpglelint-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Lint ILE/RPG programs"
arch=("any")
url="https://github.com/andlrc/rpglelint"
license=("PerlArtistic")
depends=("perl>=5.16")
makedepends=("git")
provides=("rpglelint")
source=('rpglelint::git+git://github.com/andlrc/rpglelint#branch=master')
md5sums=("SKIP")

package()
{
	cd "$srcdir/${pkgname%-git}"
	install -D rpglelint $pkgdir/usr/bin/rpglelint
	install -D RPG/ $pkgdir/usr/share/perl5/vendor_perl/RPG/
}
