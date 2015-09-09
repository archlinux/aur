# Maintainer: Kevin Guan <KevinGuan.gm@gmail.com>

pkgname='silver'
pkgver=2.3
pkgrel=1
pkgdesc="A simple, lightweight AUR package downloader"
arch=('any')
license=('GPL2')
url="https://github.com/K-Guan/silver"
depends=('python3')
optdepends=('git: for download package use git')
source=(https://codeload.github.com/K-Guan/${pkgname}/tar.gz/${pkgver})
sha256sums=('a093c427248073495e1f88e66295fd37d36b3126d7aeeb8d2e786de751c65396')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	mv silver ${pkgdir}/usr/bin
}
