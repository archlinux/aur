# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-reactionq3
pkgver=3.2
pkgrel=1
pkgdesc="Reaction Quake 3 is modification for Quake 3 modeled after games like ActionQ2 and ActionHL, that recreate an action movie atmosphere."
url="http://www.rq3.com/"
license=""
depends=('quake3')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=('http://www.rq3.com/ReactionQuake3-v3.2-Full.zip')
md5sums=('9d376db7be9c2990953b93fae075458b')

build() {
	cd $startdir/src/

	# Base RQ3 Files	
	install -d $startdir/pkg/opt/quake3/
	unzip ReactionQuake3-v3.2-Full.zip -d $startdir/pkg/opt/quake3/
}
