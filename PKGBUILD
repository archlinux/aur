# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-reactionq3
pkgver=3.2
pkgrel=2
pkgdesc="Reaction Quake 3 is modification for Quake 3 modeled after games like ActionQ2 and ActionHL, that recreate an action movie atmosphere."
url="http://www.rq3.com/"
license=('custom')
arch=('any')
depends=('quake3')
source=('ftp://ftp.euronet.nl/pub/orange/games/Quake3/mods/Reaction/ReactionQuake3-v3.2-Full.zip')
md5sums=('9d376db7be9c2990953b93fae075458b')
PKGEXT='.pkg.tar'

package() {
    # Create Destination Directory
    install -d ${pkgdir}/opt/quake3/

    # Intrall RQ3 Files
    mv ${srcdir}/rq3 ${pkgdir}/opt/quake3/
}
