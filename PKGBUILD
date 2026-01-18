# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>
pkgname=('projectctr-makerom-bin')
pkgver=0.19.0
pkgrel=1
pkgdesc="Creates CTR cxi/cfa/cci/cia files"
arch=('x86_64')
url="https://github.com/3DSGuy/Project_CTR/"
license=('unknown')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha256sums=('287b809dec064e0ad597e3d272c49ecb7eed41693d5ee6fef9d8a8aa24c2497e')

source=("$pkgname-$pkgver.zip::https://github.com/3DSGuy/Project_CTR/releases/download/makerom-v$pkgver/makerom-v$pkgver-ubuntu_x86_64.zip")

package() {
    install -D "$srcdir/makerom" "$pkgdir/usr/bin/makerom"
}
