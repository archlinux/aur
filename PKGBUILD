# Maintainer: Feresey <p.milko1999@yandex.ru>

pkgname=prime
pkgdesc="PRIME Render Offload Launcher. Please visit https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html to manually configure your Device."
url="https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html"
pkgver=0.0
pkgrel=2
arch=(any)
license=()
conflicts=(bumblebee optimus-manager)
depends=(bash xorg-server-devel-git)

source=(prime 10-nvidia.conf)
md5sums=('6251c4caccc4786c13d253a7803e67ed'
         '317c1136a06f746bdeb02b0914c63ab4')
package()
{
	mkdir -p "${pkgdir}"/usr/bin/
	mkdir -p "${pkgdir}"/etc/X11/xorg.conf.d/
	install -m a+xr ./prime "${pkgdir}"/usr/bin/
	cp 10-nvidia.conf "${pkgdir}"/etc/X11/xorg.conf.d/

}
