# Maintainer: Matthieu Valleton <mvalleton@seos.fr>

_npmname=jsinspect
pkgname=nodejs-"$_npmname"
pkgver=0.12.7
pkgrel=1
pkgdesc='Detect copy-pasted and structurally similar JavaScript code.'
arch=('any')
url='https://www.npmjs.com/package/jsinspect'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('82fb27e14271c0d9ba37672aa4c946400b4e6ed813becc33f8f09a282c7c494b')
noextract=("${source[@]##*/}")

package() {
    npm install -g --prefix "$pkgdir/usr" "${source[@]##*/}"
}
