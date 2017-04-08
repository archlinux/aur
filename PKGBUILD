# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-reactionq3
pkgver=3.2
pkgrel=2
pkgdesc="Reaction Quake 3 is modification for Quake 3 modeled after games like ActionQ2 and ActionHL, that recreate an action movie atmosphere."
url="http://www.rq3.com/"
license=('custom')
arch=('any')
depends=('quake3')
source=('http://slashbunny.com/aur/quake3-reactionq3/ReactionQuake3-v3.2-Full.zip')
sha256sums=('c84de808ac5bd369a2047553745a1b2cb2fd8afe31a0ea6b8380424da5652bb1')
PKGEXT='.pkg.tar'

package() {
    # Create Destination Directory
    install -d "${pkgdir}/opt/quake3/"

    # Intrall RQ3 Files
    mv "${srcdir}/rq3" "${pkgdir}/opt/quake3/"
}
