# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=openhab4-addons-frigate
pkgver=1.9
pkgrel=1
_openhab=openhab4
_openhab4=4.1.1
_pkgname=org.openhab.binding.mqtt.frigatesvr-${_openhab4}
pkgdesc="Frigate SVR binding for OpenHAB."
arch=('any')
url="https://github.com/jgow/org.openhab.binding.mqtt.frigatesvr"
license=('EPL')
depends=('openhab4=4.1.1')
install=frigatesvr.install
source=("${_pkgname}-${pkgver}.jar::${url}/releases/download/v${pkgver}-${_openhab4}/${_pkgname}.jar")
b2sums=('5a322a646e71ce73593d51831c7d11858e2b49db846a65836d9e8ea683f65c0df4c47b69c1690563bedb721aba9ea5f30164c94029180d031d9aa1e43473d2fd')

package() {
	install -d "$pkgdir/usr/share/${_openhab}/addons"
	install -Dm644 ${_pkgname}-${pkgver}.jar "$pkgdir/usr/share/${_openhab}/addons/${_pkgname}.jar"
}
