# Maintainer: Camilo Prieto <camilo.prieto93@gmail.com>
pkgname=boostnote-bin
pkgver=0.11.8
pkgrel=1
pkgdesc="Open source note-taking app for programmers. Official binary."
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
depends=('electron' 'nodejs')
conflicts=('boostnote')

source_x86_64=("https://github.com/BoostIO/boost-releases/releases/download/v${pkgver}/boostnote_${pkgver}_amd64.deb")
sha512sums_x86_64=('68763547d8495c1607d20727fa3b07b2e873859882c78c17721f149f354a36affe4e1869080b1dac47bce09802d84d0f76bdd78ce226fe897e9ebf01139b8373')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
}

