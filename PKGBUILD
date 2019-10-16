
pkgname='inlein'
pkgdesc='running clojure scripts'
pkgver='0.2'
pkgrel='1'
epoch=
arch=('i686' 'x86_64')
url='http://inlein.org'
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
changelog=
source=("https://github.com/hypirion/inlein/releases/download/0.2.0/inlein")
#source("$srcdir/inlein")
#noextract=("${srcdir}/inlein")
sha256sums=("0d89b5373471bfb9e266f0f1229ac056fb713fbf2742317445b2d8e9d7f43e36")
# PKGEXT='.pkg.tar.gz'

package() {
# cd "$srcdir"
  
# cd "$pkgdir"
  # mkdir -p $pkgdir
sudo install -Dm755 "$srcdir/../inlein" "/usr/local/bin/inlein"
}
