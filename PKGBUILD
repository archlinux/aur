# Maintainer: Kevin Guan <KevinGuan.gm@gmail.com>

pkgname='silver'
pkgver=1.3
pkgrel=1
pkgdesc="A simple, lightweight AUR package downloader"
arch=('any')
license=('GPL2')
url="https://github.com/K-Guan/silver"
depends=('python3')
optdepends=('git: for download package use git')
source=(https://codeload.github.com/K-Guan/${pkgname}/tar.gz/${pkgver})
sha256sums=('f9584d539e02efd26e6727b82c70e7831f13852d49f18d66a1afa4653b06ffa7')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	mv silver ${pkgdir}/usr/bin
}
