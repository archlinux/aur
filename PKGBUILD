pkgname_orig=hpack
pkgname=${pkgname_orig}-static-bin
pkgver=0.38.0
pkgrel=1
pkgdesc="A modern format for Haskell packages (statically linked binary)"
arch=('x86_64')
url=https://github.com/sol/hpack
provides=('hpack')
license=('MIT')
depends=('gmp' 'zlib')
conflicts=('haskell-hpack')
binname=${pkgname_orig}-${pkgver}-${pkgrel}
source_x86_64=(
	"${binname}.gz::${url}/releases/download/${pkgver}/${pkgname_orig}_linux.gz"
)
sha512sums_x86_64=(
	'6d5b9149cc16ad24a8ce349de1f632d5f7d0989115a9483fd77ae35cbe090bc1d9b6df164200274d1ff641d5ca056b34cdc5569a66bb0b0f5aba219c456506d8'
)

package(){
	install -Dm755 "${binname}" "$pkgdir/usr/bin/${pkgname_orig}"
}
