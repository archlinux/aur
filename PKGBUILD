# Maintainer: Robin Broda <robin at broda dot me>

pkgname=glava
pkgver=1.6.3
pkgrel=2
pkgdesc='OpenGL audio spectrum visualizer'
arch=('x86_64')
url='https://github.com/wacossusca34/glava'
license=('GPL3')
depends=('x-server' 'pulseaudio' 'libxext' 'libxcomposite' 'libxrender')
makedepends=('git' 'python')
source=("git+https://github.com/wacossusca34/glava#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
	cd "${pkgname}"
}

build() {
	cd "${pkgname}"

	make
}

package() {
	cd "${pkgname}"

	make DESTDIR="${pkgdir}/" install
}
