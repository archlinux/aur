# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=less-plugin-autoprefix
pkgname=nodejs-${_npmname}
pkgver=2.0.0
pkgrel=2
pkgdesc='Uses autoprefixer to add prefixes to css after conversion from less'
arch=(any)
url='http://lesscss.org'
license=('Apache 2.0')
depends=('nodejs' 'nodejs-less' 'nodejs-autoprefixer')
makedepends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('aa7edec73f63896fc4670d05d15d4344ba0e276479dec2672915a54cb5519e6f')
noextract=("${source[@]##*/}")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${source[@]##*/}"
}
