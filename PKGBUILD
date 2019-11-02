pkgname=ca-certificates-blacklist-cnnic
pkgver=3.30.1
pkgrel=1
pkgdesc="A set of broken CAs' certificates which should not be trusted (CNNIC only)"
arch=(any)
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
license=('MPL' 'GPL')
depends=('ca-certificates-utils')
sha256sums=('35718b9720580939c8b7424324c4164f0b8b6beed36769b187993c1bf5f98643'
			'2053fd9aa4885706e7e45f3c40d685c2ccfcfd7db1d25291d08c6590a4b67bf6')
source=("CNNIC_ROOT:2.4.73.51.0.1.crt"
        "China_Internet_Network_Information_Center_EV_Certificates_Root:2.4.72.159.0.1.crt")

package() {
	install -D -m 644 'CNNIC_ROOT:2.4.73.51.0.1.crt' "${pkgdir}/usr/share/ca-certificates/trust-source/blacklist/CNNIC_ROOT:2.4.73.51.0.1.crt"
	install -D -m 644 'China_Internet_Network_Information_Center_EV_Certificates_Root:2.4.72.159.0.1.crt' "${pkgdir}/usr/share/ca-certificates/trust-source/blacklist/China_Internet_Network_Information_Center_EV_Certificates_Root:2.4.72.159.0.1.crt"
}
