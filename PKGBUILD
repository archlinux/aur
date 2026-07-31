# Maintainer: aloxaf <aloxafx@gmail.com>

pkgname=rpgmakerdecrypter-bin
pkgver=3.0.4
pkgrel=1
pkgdesc='Tool for decrypting and extracting RPG Maker encrypted archives and files'
arch=('x86_64')
url='https://github.com/uuksu/RPGMakerDecrypter'
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
provides=('rpgmakerdecrypter')
conflicts=('rpgmakerdecrypter')
options=('!strip')
source=("RPGMakerDecrypter-cli-${pkgver}::https://github.com/uuksu/RPGMakerDecrypter/releases/download/v${pkgver}/RPGMakerDecrypter-cli")
sha256sums=('c44cfa04abbc2a9debb0db16460eeaeb8e8a7e960abe509f8c32314fb82872bc')

package() {
	install -Dm755 "${srcdir}/RPGMakerDecrypter-cli-${pkgver}" \
		"${pkgdir}/usr/bin/RPGMakerDecrypter-cli"
}
