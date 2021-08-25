#!/usr/bin/env bash
# Maintainer: Xenose <xenose@live.com>
# Contributor: Xenose
pkgname=split-run-git
pkgver=1.0.0
pkgrel=1
arch=('any')
url="https://gitlab.com/Xenose/split-run.git"
license=('GPL3')
depends=()
makedepends=('clang' 'git' 'make')
arch=('any')
pkgdesc="Launches programs from the terminal and the closes the terminal automatically"
provides=('srun')
conflicts=('srun')
source=("git+$url")
md5sums=('SKIP')

build() {
	cd split-run
	make
}

package() {
	cd split-run
	sudo make install
}
