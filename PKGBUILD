# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=xc3028l-fw
pkgver=v36
pkgrel=1
pkgdesc="Firmware for Xceive XC3028L tuners (Example: ATI/AMD TV Wonder HD 600 USB)"
arch=('any')
url="http://linuxtv.org/wiki/index.php/ATI/AMD_TV_Wonder_HD_600_USB"
license=('GPL')
source=("http://steventoth.net/linux/hvr1400/xc3028L-v36.fw")
sha256sums=('d9d46737eaa38217fa979c0132a68d5dfa6c1c73457893ea7e9fef0a00f856b4')

package() {
    install -D -m 0644 "${srcdir}/xc3028L-v36.fw" \
        "${pkgdir}/usr/lib/firmware/xc3028L-v36.fw"
}

