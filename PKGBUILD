
pkgname=newrelic-infra
pkgver=1.11.26
pkgrel=1
license=('custom')
arch=('x86_64')
depends=('curl')
url=https://download.newrelic.com/infrastructure_agent/linux/apt/pool/main/n/newrelic-infra
source=($url/newrelic-infra_systemd_${pkgver}_systemd_amd64.deb)
sha256sums=('6123dcc1c206db060675feecc978662441347c6ad697bf2b56d5cf2f244ca321')

package() {
	tar xvf "${srcdir}/data.tar.gz"
	
	cp -Ra "${srcdir}/etc" "${pkgdir}"
	cp -Ra "${srcdir}/usr" "${pkgdir}"
	cp -Ra "${srcdir}/var" "${pkgdir}"
}
