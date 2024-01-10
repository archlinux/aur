# Maintainer: thek4n

pkgname='note-manager'
pkgver=1.15.1
pkgrel=1
pkgdesc="Simple CLI notes manager"
arch=('any')
url='https://github.com/thek4n/note'
license=('MIT')
depends=(
  'git'
)
optdepends=(
  'python-grip: render tips in browser'
  'fzf: find notes'
  'bat: render tips in terminal'
  'tree: tree of notes'
)
conflicts=('note-manager')
source=("$pkgname::git+https://github.com/thek4n/note.git#branch=master")
sha256sums=('SKIP')

package() {
    cd "$srcdir"/"$pkgname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
