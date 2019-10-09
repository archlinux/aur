# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=pandiff
pkgname=nodejs-"$_npmname"
pkgver=0.5.0
pkgrel=1
pkgdesc='Prose diffs for any document format supported by Pandoc'
arch=('any')
url="https://github.com/davidar/pandiff#readme"
license=('MIT')
depends=('nodejs' 'npm' 'pandoc')
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]##*/}")
sha256sums=('2ca38a951203aabdea1b198289e531562c7ee5ca00eda9e42012a4bf10a4978c')

package() {
  npm install -g --prefix "$pkgdir/usr" "${source[@]##*/}"
}

# vim:set ts=2 sw=2 et:
