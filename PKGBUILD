# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=tc-viewer
pkgver=1.5
pkgrel=2
pkgdesc="Watch transfers in HTB and HFSC traffic shaping classes on specified interface."
arch=(any)
url="https://web.archive.org/web/20100604054114/http://pawilcz.eu/tc-viewer/tc-viewer.html"
license=(GPL)
depends=(iproute2)
source=(https://gitlab.com/post-factum/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
backup=(etc/tc-viewer/tc-viewer.conf)
sha256sums=('3fa9019a993ca709bb512fabf971691a781426b40d7a4a6359fa5ab474c705c5')

package() {
	cd "${pkgname}-v${pkgver}"

	install -Dt "${pkgdir}"/usr/bin -m0755 tc-viewer
	install -Dt "${pkgdir}"/etc/tc-viewer -m0644 tc-viewer.conf
}
