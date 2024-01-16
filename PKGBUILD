# Maintainer Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=scroll
pkgname_=${pkgname}-cli
pkgver=72.4.3
pkgrel=1
pkgdesc="Tools for thought. An extensible alternative to Markdown."
arch=(any)
url="https://github.com/breck7/scroll"
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname_}/-/${pkgname_}-${pkgver}.tgz")
noextract=("${pkgname_}-${pkgver}.tgz")
sha256sums=('f3499d5dd120ce994cd0050059b1f4f8e1ad1f8ef783fd3b145c5d045d64bdeb')

package(){
	npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname_}-${pkgver}.tgz"
}
