# Maintainer: Pablo Moyano (p4block)
pkgname=glmviz-git
pkgver=1.0
pkgrel=1
pkgdesc='High framerate, dB correct OpenGL music visualizer with FiFo buffers and PulseAudio input support'
arch=('x86_64')
url='https://github.com/hannesha/GLMViz'
license=('GPL3')
depends=(glm fftw glfw-x11 libconfig)
optdepends=(pulseaudio)
source=("git+https://github.com/hannesha/GLMViz.git")
md5sums=('SKIP')

build() {
	
	cd "${srcdir}/GLMViz"
        mkdir -p build
        cd build
        cmake ..

}

package() {
	cd "${srcdir}/GLMViz/build"
	make DESTDIR=${pkgdir} install

}
