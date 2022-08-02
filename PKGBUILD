# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=hukkin
_pkgname=cosmosvanity
pkgname=${_pkgname}-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="CLI tool for generating Cosmos vanity addresses"
arch=('x86_64')
url="https://github.com/${_orgname}/${_pkgname}"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_orgname}/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('676c239dae809d1698f629af1fdfcf1672cf4562f59841f06d2fe0cdd2025c61')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
