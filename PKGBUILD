# Maintainer: Alexander Chaplin Braz <contact@alexchaplinbraz.com>
pkgname='ablavema-bin'
_pkgname='ablavema'
pkgver=0.1.0
pkgrel=1
pkgdesc='A Blender launcher and version manager'
arch=('x86_64')
url='https://github.com/AlexChaplinBraz/Ablavema'
license=('MIT')
depends=('gtk3' 'glib2' 'gcc-libs' 'fontconfig' 'freetype2' 'glibc' 'xz' 'openssl' 'libx11')
conflicts=('ablavema' 'ablavema-git')
source_x86_64=("$url/releases/download/$pkgver/ablavema-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e38543d541060162241a5d2ec501cec7780aad0114c1ddcc7717be2d5e7748aa')

package() {
	install -Dm644 "${srcdir}/ablavema-$pkgver-x86_64-unknown-linux-gnu/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "${srcdir}/ablavema-$pkgver-x86_64-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

