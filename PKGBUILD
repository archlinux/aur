
pkgname=newrelic-infra
pkgver=1.0.336
pkgrel=1
license=('custom')
arch=('x86_64')
depends=('curl')
url=https://download.newrelic.com/infrastructure_agent/linux/apt/pool/main/n/newrelic-infra
source=($url/newrelic-infra_systemd_${pkgver}_amd64.deb)
sha256sums=('cbb4f9eaa497114b470d3b62b13f11c49101916d5e914294399ecaf45f330a39')

package() {
	cp -Ra "${srcdir}/etc" "${pkgdir}"
	cp -Ra "${srcdir}/usr" "${pkgdir}"
	cp -Ra "${srcdir}/var" "${pkgdir}"
}
