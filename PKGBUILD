# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>

pkgname=hotspotshield-bin
pkgver=1.0.7
pkgrel=1
arch=('x86_64')
pkgdesc='Stay secure and private on your Linux.'
url='https://www.hotspotshield.com/'
license=('other')
source=("$pkgname-$pkgver.deb::https://control.kochava.com/v1/cpi/click?campaign_id=kohotspot-shield-web-linux-a29j1rn1c15263ed2db753&network_id=5798&ko_exchange=true&device_id=device_id&site_id=1&aftr=%7B%22vh%22%3A%22ext13a73100-89a7-11eb-8ab7-395ddfe0c16e%22%2C%22referrer%22%3A%22https%3A%2F%2Faccount.hotspotshield.com%2F%22%2C%22af_medium%22%3A%22serp%22%2C%22af_source%22%3A%22duckduckgo%22%2C%22af_campaign%22%3A%22seo-organic%22%7D&aftr_source=%2Fvpn%2Fvpn-for-linux%2F")
package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"
	rm -rf $pkgdir/etc/apt
}
b2sums=('bcc5702d70d3705834730817c2fd44f8522c340434fea188e63fe4c940d42e1b7075f272a7a905e94ff209d1cf0b107ed65eda06c8eb3ec35f81dc866da18f05')
