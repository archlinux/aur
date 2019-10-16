
pkgname='origami.ok'
pkgdesc='running clojure scripts'
pkgver='4.1.1'
pkgrel='1'
epoch=
arch=('i686' 'x86_64')
url='https://github.com/hellonico/origami-scripting'
license=('EPL')
groups=()
depends=()
#makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
# install="$pkgname.install"
# changelog=
source=("https://raw.githubusercontent.com/hellonico/origami-scripting/master/ok.clj")
#source("$srcdir/inlein")
#noextract=("${srcdir}/inlein")
sha512sums=("04f3c6b1f58c2d8448b3d4db9c73aedb742752d0f90d5ac4b148556cc7e0a16cc4af98f18e4beb9c1b80765b59ba60affc2bc695251aa6f2522b6d7028654562")
# PKGEXT='.pkg.tar.gz'

package() {
	sudo install -Dm755 "$srcdir/../ok.clj" "/usr/local/bin/ok.clj"
}
