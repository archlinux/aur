# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=pandiff
pkgname=nodejs-"$_npmname"
pkgver=0.4.0
pkgrel=1
pkgdesc='Prose diffs for any document format supported by Pandoc'
arch=('any')
url="https://github.com/davidar/pandiff#readme"
license=('MIT')
depends=('nodejs' 'npm' 'pandoc')
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]##*/}")
sha256sums=('c0ed3023241a27286cd8f7ce9388d456d39517cb65647565027abdb50f8d99f5')

package() {
  npm install -g --prefix "$pkgdir/usr" "${source[@]##*/}"
}

# vim:set ts=2 sw=2 et:
