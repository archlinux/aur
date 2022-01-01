# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=ovs-wrapper
pkgname=python-$_pyname
pkgver=2.14.2
pkgrel=2
pkgdesc="Python Open vSwitch library wrapper"
arch=(any)
url="http://www.openvswitch.org/"
license=(Apache)
depends=(openvswitch)
makedepends=(python-setuptools)
options=(!emptydirs)
source=()

package(){
	local _pydir="$pkgdir/usr/lib/python3.10/site-packages"
	local _ovsdir="/usr/share/openvswitch/python"
	mkdir -p "${_pydir}"
	cd "${_pydir}"
	ln -sf "${_ovsdir}/ovs" "${_pydir}"
	ln -sf "${_ovsdir}/ovstest" "${_pydir}"
}
