pkgname=lib32-xcb-util-image
pkgver=0.4.0
pkgrel=1
pkgdesc="32bit xcb-util-image"
arch=('x86_64')
url="http://xcb.freedesktop.org/"
license=('custom')
depends=('lib32-libxcb' 'xcb-util-image')
source=(https://www.archlinux.org/packages/extra/i686/xcb-util-image/download/#xcb-util-image-i686.pkg.tar.xz)
md5sums=('SKIP')
pkgver() {
        cat $srcdir/.PKGINFO | grep -oP '(?<=pkgver = )\d+\.\d+\.\d+'
}
package() {
        mkdir -p "${pkgdir}/usr/lib32"
	cp -rPf "${srcdir}/usr/lib/"lib* "${pkgdir}/usr/lib32"
}
