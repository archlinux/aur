# Maintainer: Feresey <p.milko1999@yandex.ru>

pkgname=prime
pkgdesc="PRIME Render Offload Launcher. Please visit https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html to manually configure your Device."
url="https://download.nvidia.com/XFree86/Linux-x86_64/435.21/README/primerenderoffload.html"
pkgver=0.0
pkgrel=0
arch=(any)
license=()
source=(prime)
md5sums=('6251c4caccc4786c13d253a7803e67ed')
depends=(bash)

package()
{
	mkdir -p "${pkgdir}"/usr/bin/
	install -m a+xr ./prime "${pkgdir}"/usr/bin/

}
