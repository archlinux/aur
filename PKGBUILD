# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Joaquim Coimbra <joaca_rj at yahoo dot com dot br>

pkgname=ttf-technical
pkgver=1
pkgrel=5
pkgdesc='A technical font used by architects and engineers'
arch=('i686' 'x86_64')
url='http://eknp.com/'
license=('unknown')
depends=('fontconfig')
source=('http://eknp.com/fonts/zip/t/technical.zip')
sha256sums=('a9014a8b2e2de52610bd44d6f923be2c648e31fc1f5d989d02373bc3984ae016')

package() {
	install -D -m0644 ${srcdir}/technical.ttf ${pkgdir}/usr/share/fonts/TTF/technical.ttf
}

