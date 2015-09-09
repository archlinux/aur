# Maintainer: Kevin Guan <KevinGuan.gm@gmail.com>

pkgname='silver'
pkgver=2.0
pkgrel=1
pkgdesc="A simple, lightweight AUR package downloader"
arch=('any')
license=('GPL2')
url="https://github.com/K-Guan/silver"
depends=('python3')
optdepends=('git: for download package use git')
source=(https://codeload.github.com/K-Guan/${pkgname}/tar.gz/${pkgver})
sha256sums=('01904c97c99abaabf36afce28bef511b2e029f4ecc51cc762f4704ce41db6b03')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	mv silver ${pkgdir}/usr/bin
}
