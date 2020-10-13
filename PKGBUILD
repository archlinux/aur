# Maintainer: Alexander Chaplin Braz <contact@alexchaplinbraz.com>
pkgname='genrepass-bin'
_pkgname='genrepass'
pkgver=1.0.1
pkgrel=1
pkgdesc='Generate a readable password from an ordered list of words extracted from text'
arch=('x86_64' 'i686')
url='https://github.com/AlexChaplinBraz/genrepass'
license=('MIT')
depends=('gcc-libs' 'libxcb' 'glibc' 'libxau' 'libxau')
conflicts=('genrepass' 'genrepass-git')
source_x86_64=("$url/releases/download/$pkgver/genrepass-x86_64-unknown-linux-gnu-$pkgver.tar.gz")
source_i686=("$url/releases/download/$pkgver/genrepass-i686-unknown-linux-gnu-$pkgver.tar.gz")
sha256sums_x86_64=('298e345f29137964c3c20d1047139c7bd79ad3189ef6cd03bee83b58aa0a9d6d')
sha256sums_i686=('cbd72d7274676b1e35ad8f09d5236c44a01b60f7754a019e6cfd519c38ad8516')

package() {
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
