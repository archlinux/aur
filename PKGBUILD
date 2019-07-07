# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=eqmodgui
pkgver=1.6.0
pkgrel=1
pkgdesc="User interface for INDI Eqmod telescope driver"
arch=('x86_64')
url="https://sourceforge.net/projects/eqmodgui"
license=('GPL3')
depends=('libindi' 'gtk2' 'sdl_mixer' 'pango')
provides=('eqmodgui')
md5sums=("3a99d068367b18bbbcabb5dfeb84aff5")

source=("https://sourceforge.net/projects/eqmodgui/files/eqmodgui_"$pkgver"/eqmodgui-"$pkgver"-114-linux_"${arch}".tar.xz")

package() {
mkdir "${pkgdir}"/usr/
tar -xf "${srcdir}"/eqmodgui-"$pkgver"-114-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
chown -R root:root "${pkgdir}/usr/"
}
