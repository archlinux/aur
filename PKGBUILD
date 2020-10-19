# Maintainer: Alexander Chaplin Braz <contact@alexchaplinbraz.com>
pkgname='genrepass-bin'
_pkgname='genrepass'
pkgver=1.1.0
pkgrel=1
pkgdesc='Generate a readable password from an ordered list of words extracted from text'
arch=('x86_64' 'i686')
url='https://github.com/AlexChaplinBraz/genrepass-cli'
license=('MIT')
depends=('gcc-libs' 'libxcb' 'glibc' 'libxau' 'libxau')
conflicts=('genrepass' 'genrepass-git')
source_x86_64=("$url/releases/download/$pkgver/genrepass-x86_64-unknown-linux-gnu-$pkgver.tar.gz")
source_i686=("$url/releases/download/$pkgver/genrepass-i686-unknown-linux-gnu-$pkgver.tar.gz")
sha256sums_x86_64=('98a06b8865ed624fa4b491dfc495161a6ffde80a2f4762d23913602d3c3b939f')
sha256sums_i686=('824db896fd09ca7c61d86392c0f7782fdedda5785903de36dd114a2937469550')

package() {
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
