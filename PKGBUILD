# Maintainer: Alexander Chaplin Braz <contact@alexchaplinbraz.com>
pkgname='genrepass-bin'
_pkgname='genrepass'
pkgver=1.0.0
pkgrel=1
pkgdesc='Generate a readable password from an ordered list of words extracted from text'
arch=('x86_64' 'i686')
url='https://github.com/AlexChaplinBraz/genrepass'
license=('MIT')
depends=('gcc-libs' 'libxcb' 'glibc' 'libxau' 'libxau')
conflicts=('genrepass' 'genrepass-git')
source_x86_64=("$url/releases/download/$pkgver/genrepass-x86_64-unknown-linux-gnu-$pkgver.tar.gz")
source_i686=("$url/releases/download/$pkgver/genrepass-i686-unknown-linux-gnu-$pkgver.tar.gz")
sha256sums_x86_64=('1125da3258f7e1b91e200c2ea03b6b6e3f6e2358ce4e9dbc313fa2fe9de6b457')
sha256sums_i686=('9061fe21bbc6b90107fc327cc6098930b34c99c2e9832e62546808ced08d4490')

package() {
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
