# Maintainer : JulioJu  < juanes  0890  at google mail dot com >
# Contributor: JulioJu  < juanes  0890  at google mail dot com >

pkgname=ocamlbricks-trunk
pkgver=1
pkgrel=1
pkgdesc="Miscellaneous utility functions in OCaml for Marionnet"
arch=(any)
# For Godi : 'tk' 'libxmu' 'freeglu' 'gtkglext'.
makedepends=('bzr' 'camlp4' 'ocaml-findlib' 'lablgtk2')
depends=()
provides=('')
conflicts=('ocamlbricks')
url="https://www.marionnet.org/"
source=("bzr+https://launchpad.net/ocamlbricks/trunk")
license=('GPL')
sha256sums=('SKIP')

build() {
        cd "${srcdir}/trunk"
        make
}

package() {
        cd "${srcdir}/trunk"
        make DESTDIR="${pkgdir}/${pkgname}-${pkgrel}" install
}
