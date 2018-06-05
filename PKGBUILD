# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=eqmodgui
pkgver=1.3.0
pkgrel=2
pkgdesc="User interface for INDI Eqmod telescope driver"
arch=('x86_64')
url="https://sourceforge.net/projects/eqmodgui"
license=('GPL3')
depends=('libindi' 'gtk2' 'sdl_mixer' 'pango')
provides=('eqmodgui')
md5sums=("4c92a6c98d7230bc360bf7570236bd0f")

source=("https://sourceforge.net/projects/eqmodgui/files/eqmodgui_"$pkgver"/eqmodgui-"$pkgver"-96-linux_"${arch}".tar.xz")

package() {
mkdir "${pkgdir}"/usr/
tar -xf "${srcdir}"/eqmodgui-"$pkgver"-96-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
chown -R root:root "${pkgdir}/usr/"
}
