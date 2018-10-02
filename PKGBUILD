# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-cli
pkgver=1.2
pkgrel=3
pkgdesc="Write.as command line interface"
arch=('x86_64')
url='https://write.as/apps/cli'
license=('GPL3')
depends=('glibc')
source=("https://github.com/writeas/writeas-cli/releases/download/v${pkgver}/writeas_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fbef7f15eecaefe1632740090b08a418a7171e49d4c789103847c19180c0420e')

package() {
	install -Dm755 "${srcdir}/writeas" "${pkgdir}/usr/bin/writeas"
}
