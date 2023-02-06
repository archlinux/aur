# Maintainer: ghesy <ehsan at disroot dot org>

pkgname=xray-assets-symlinks
pkgver=r1
pkgrel=1
pkgdesc="symlinks for making v2ray's geoip and domain-list assets available to xray"
url="https://aur.archlinux.org/packages/$pkgname"
depends=('v2ray-geoip' 'v2ray-domain-list-community')
provides=('xray-geoip' 'xray-domain-list-community')
conflicts=("${provides[@]}")
arch=('any')

package() {
    install -dm755 "${pkgdir}/usr/share/xray/"
	ln -s /usr/share/v2ray/geo{ip,site}.dat -t "${pkgdir}/usr/share/xray/"
}
