# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="nautilus-lxsplit"
pkgver="0.0.2.0"
pkgrel="1"
pkgdesc="An extension for Nautilus to split and join files"
arch=('any')
url="https://www.atareao.es/apps/dividir-archivos-en-varias-partes-con-nautilus-lxsplit-en-ubuntu/"
license=('GPL3')
depends=('libnautilus-extension' 'lxsplit')
makedepends=('')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/nautilus-extensions/+files/${pkgname}_${pkgver}-1ubuntu0.tar.xz")
sha256sums=('c9e25635a57f28c8dc5ac33606524567fcfc83f24d087e6b64be92b04d9eef0f')
install="${pkgname}.install"

build() {
	cd "${srcdir}/${pkgname}"
}

package() {
    cd "${pkgdir}"
    install -d ${pkgdir}/usr/share/nautilus-python/extensions

	cd "${srcdir}/${pkgname}"
    mv ./src/nautilus-lxsplit.py ${pkgdir}/usr/share/nautilus-python/extensions/
}

# vim:set ts=4 sw=2 ft=sh et:
