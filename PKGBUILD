pkgname=lib32-xcb-util-keysyms
pkgver=0.4.0
pkgrel=1
pkgdesc="32bit xcb-util-keysyms"
arch=('x86_64')
url="http://xcb.freedesktop.org/"
license=('custom')
depends=('lib32-libxcb' 'lib32-libxdmcp' 'xcb-util-keysyms')
source=(https://www.archlinux.org/packages/extra/i686/xcb-util-keysyms/download/#xcb-util-keysyms-i686.pkg.tar.xz)
md5sums=('SKIP')
pkgver() {
        cat $srcdir/.PKGINFO | grep -oP '(?<=pkgver = )\d+\.\d+\.\d+'
}
package() {
        mkdir -p "${pkgdir}/usr/lib32"
	cp -rPf "${srcdir}/usr/lib/"lib* "${pkgdir}/usr/lib32"
}
