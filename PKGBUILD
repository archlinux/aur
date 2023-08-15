# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('html-builder-cli-git')
pkgver=3.0.0.r0.g1efeded
pkgrel=1
pkgdesc="The fastest way to package an HTML project into a fully native desktop app"
arch=('any')
url="https://github.com/yikuansun/html-builder-cli"
license=('GPL3')
makedepends=('git' 'nodejs' 'npm')
provides=('html-builder-cli')
conflicts=('html-builder-cli')
source=("git+https://github.com/yikuansun/html-builder-cli")
md5sums=('SKIP')

pkgver() {
  cd html-builder-cli
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd html-builder-cli
	sudo npm install -g
}

package() { 
    echo
    echo
    echo 'html-builder-cli has been successfully built and installed globally'
    echo
    echo
}
