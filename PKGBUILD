# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=openhab4-addons-frigate
pkgver=2.0
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
b2sums=('ae640edf5e552bf983fe78e9ff233780685077bfba3e56aa5a0f62f187f0bd4fda40a52b84a0d651ee9c59c8a2dab48cb0a95f696303e058af86d666ac3c0127')

package() {
	install -d "$pkgdir/usr/share/${_openhab}/addons"
	install -Dm644 ${_pkgname}-${pkgver}.jar "$pkgdir/usr/share/${_openhab}/addons/${_pkgname}.jar"
}
