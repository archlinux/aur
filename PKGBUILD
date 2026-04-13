# Maintainer: Debba <debba@example.com>
pkgname=tuxmeter-bin
_pkgname=tuxmeter
pkgver=0.0.2
pkgrel=1
pkgdesc="An open source AI subscription limit tracker for Linux"
arch=('x86_64')
url="https://github.com/debba/tuxmeter"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsecret')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('b9db3e9003614bda89054b63e64b28fa6a652c348d268fe505c4e289e0aab500')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
