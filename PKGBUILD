# Maintainer: altaway <aur@altaway.uk> 
pkgname_orig=hpack
pkgname=${pkgname_orig}-static-bin
pkgver=0.34.2
pkgrel=1
pkgdesc="A modern format for Haskell packages (statically linked binary)"
arch=('x86_64')
url="https://github.com/sol/hpack"
license=('MIT')
depends=('gmp' 'zlib')
conflicts=('haskell-hpack')
binname=${pkgname_orig}-${pkgver}-${pkgrel}
source_x86_64=(
	"${binname}.gz::${url}/releases/download/${pkgver}/${pkgname_orig}_linux.gz"
)
sha512sums_x86_64=(
	'c3916d605ed745f85bd2c862f4648a3256c143c39871a92d453ab43a5ba2d2797a19daf2feebfbef7bf4671d2db0b896b5539a7d3bd0f843c3926f7f55d8c303'
)

package(){
	install -Dm755 "${binname}" "$pkgdir/usr/bin/${pkgname_orig}"
}
