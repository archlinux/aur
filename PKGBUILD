# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=eqmodgui
pkgver=1.4.0
pkgrel=1
pkgdesc="User interface for INDI Eqmod telescope driver"
arch=('x86_64')
url="https://sourceforge.net/projects/eqmodgui"
license=('GPL3')
depends=('libindi' 'gtk2' 'sdl_mixer' 'pango')
provides=('eqmodgui')
md5sums=("08c172a39f6741f6ac9febf5e8b27b2e")

source=("https://sourceforge.net/projects/eqmodgui/files/eqmodgui_"$pkgver"/eqmodgui-"$pkgver"-104-linux_"${arch}".tar.xz")

package() {
mkdir "${pkgdir}"/usr/
tar -xf "${srcdir}"/eqmodgui-"$pkgver"-104-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
chown -R root:root "${pkgdir}/usr/"
}
