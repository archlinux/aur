# Maintainer:
pkgname=graph-editor-linux
pkgver=0.1
pkgrel=1
pkgdesc="Graph editor for Linux"
arch=(x86_64)
url="https://github.com/Student-Team-Projects/Graph-Editor-Linux"
license=('GPL')
makedepends=('git' 'make' 'gradle' 'autoconf' 'jdk' 'java-runtime>11')
source=("git+$url#branch=main")
md5sums=('SKIP')

build() {
	cd "Graph-Editor-Linux"
        git submodule init
        git submodule update
}

package() {
	cd "Graph-Editor-Linux"
    gradle run
}

