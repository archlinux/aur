# Maintainer: Kevin Guan <KevinGuan.gm@gmail.com>

pkgname='silver'
pkgver=1.2
pkgrel=1
pkgdesc="A simple, lightweight AUR package downloader"
arch=('any')
license=('GPL2')
url="https://github.com/K-Guan/silver"
depends=('python3')
optdepends=('git: for download package use git')
source=(https://codeload.github.com/K-Guan/${pkgname}/tar.gz/${pkgver})
sha256sums=('4c8b6c16b9f5d770462f807cb73ecdf29cc2d49882a656bf8a48ef5a93a4753e')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	mv silver ${pkgdir}/usr/bin
}
