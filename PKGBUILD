# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>
pkgname=('projectctr-makerom-bin')
pkgver=0.18.3
pkgrel=1
pkgdesc="Creates CTR cxi/cfa/cci/cia files"
arch=('x86_64')
url="https://github.com/3DSGuy/Project_CTR/"
license=('unknown')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha256sums=("6f36f77946742d2b8286a92d887e845e06d430998ed4a9c4856d8ea2d4eebd6f")

source=("$pkgname-$pkgver.zip::https://github.com/3DSGuy/Project_CTR/releases/download/makerom-v$pkgver/makerom-v$pkgver-ubuntu_x86_64.zip")

package() {
    install -D "$srcdir/makerom" "$pkgdir/usr/bin/makerom"
}
