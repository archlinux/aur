# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=autoenv
pkgver=0.1.0
pkgrel=1
pkgdesc='Directory-based environments'
url="https://github.com/kennethreitz/${pkgname}"
license=('custom')
checkdepends=('bash' 'zsh' 'dash')
conflicts=("${pkgname}-git")
source=(https://github.com/kennethreitz/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('47279a31f3fc03531d99fd888a102eee')
arch=('any')
install='autoenv.install'

# This will be possbile with v0.2.0
#check() {
#
#}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm644 activate.sh "${pkgdir}/usr/share/autoenv/activate.sh"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
