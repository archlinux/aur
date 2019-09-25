# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.

# Maintainer: Yang Niao <ksmt4699 at gmail dot com>
pkgname=sldc
pkgver=1.1
pkgrel=1
pkgdesc="sldc is SereneLinux Container for its developer."
arch=("x86_64")
url="https://github.com/locareen/sldc"
license=('GPL')
groups=("sld")
depends=('xorg-xhost' 'qemu')
makedepends=('zstd')
source=("https://github.com/locareen/sldc/releases/download/${pkgver}/$pkgname-$pkgver.tar.zst")
md5sums=("6855af5fa9b489acfe6d60d23d6a5f09")
package() {
        rm $pkgname-$pkgver.tar.zst
        mkdir -p ${pkgdir}/usr/bin
        mkdir -p ${pkgdir}/opt/slim
        cp $srcdir/* ${pkgdir}/usr/bin/
        chmod 755 ${pkgdir}/usr/bin/*
}

