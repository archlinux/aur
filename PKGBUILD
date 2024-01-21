# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>
pkgname=('projectctr-makerom-bin')
pkgver=0.18.4
pkgrel=1
pkgdesc="Creates CTR cxi/cfa/cci/cia files"
arch=('x86_64')
url="https://github.com/3DSGuy/Project_CTR/"
license=('unknown')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha256sums=('dd596854718c195c6e3229286be485b122921715555af8ae5cf8e9a465d9f970')

source=("$pkgname-$pkgver.zip::https://github.com/3DSGuy/Project_CTR/releases/download/makerom-v$pkgver/makerom-v$pkgver-ubuntu_x86_64.zip")

package() {
    install -D "$srcdir/makerom" "$pkgdir/usr/bin/makerom"
}
