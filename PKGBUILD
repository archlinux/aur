# Maintainer: Juan Cabrera <juan.cabrera at tu-dresden dot de>
pkgname=netctl-eduroam-tu-dresden
pkgver=0.1
pkgrel=1
pkgdesc='Example netctl profile for eduroam at TU Dresden'
arch=(any)
url=https://raw.githubusercontent.com/JuanCabre/arch_pckgs/master/eduroam-tu-dresden/eduroam-tu-dresden
license=(MIT)
depends=(ca-certificates netctl)
source=(eduroam-tu-dresden)
install=install
md5sums=('846cb8c3df725e968ec83a0948ae449a')
sha256sums=('91ac966c6cfe12d990cae8bcb2ecba9758a779d5a2bb8e48b03a4ca87762a3d5')

package() {
	mkdir -p $pkgdir/etc/netctl/examples/
	cp eduroam-tu-dresden $pkgdir/etc/netctl/examples/
}
