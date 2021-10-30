# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Changseo Jang <changseo.jang@korea.edu>
pkgname='pbkit'
pkgver='v0.0.22'
pkgrel=1
epoch=
pkgdesc='Protobuf Dependency Manager'
arch=('x86_64')
url=''
license=('MIT' 'APACHE')
groups=()
depends=()
makedepends=('git' 'deno')
checkdepends=()
optdepends=()
provides=('pollapo' 'pb')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("pbkit::git://github.com/pbkit/pbkit.git#tag=${pkgver}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
  deno install --unstable -A -n pollapo "$srcdir/pbkit/cli/pollapo/entrypoint.ts"
  deno install --unstable -A -n pb "$srcdir/pbkit/cli/pb/entrypoint.ts"
}
