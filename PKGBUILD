# Maintainer: Adrien Smith <adrien[at]bouldersmiths[dot]com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>
# Contributor: gueek <cyttam[at]gmail[dot]com>

pkgname=pngout
pkgver=20150319
pkgrel=1
pkgdesc="Lossless PNG compressor"
arch=('i686' 'x86_64')
url="http://www.jonof.id.au/kenutils"
license=('custom')
depends=('glibc')
source=("http://static.jonof.id.au/dl/kenutils/${pkgname}-${pkgver}-linux.tar.gz"
	      pngout.completion
	      LICENSE)
md5sums=('a48761bb753622c846b4846be60c7e4b'
         '99a75d19ff6278f04c66358ce67e8eed'
         '6aca04829b82718d2cb26c9b45f9a570')
sha256sums=('078a9ec068cc4d79ceca332b9e2117151c4584ee0e917e253d4fe80703499b47'
            '8952df609f738751d5830f431d3da23f7551b8796d773665baa8d10b5ea11074'
            'eb52d51be70d26eb7dfca460fafe50f8e5e36937b9e9bce68a5a079d4951a592')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-linux/${CARCH}/pngout" \
		"${pkgdir}/usr/bin/pngout"
  install -Dm644 "${srcdir}/pngout.completion" "${pkgdir}/etc/bash_completion.d/pngout"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
