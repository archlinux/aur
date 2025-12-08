# Maintainer: Carsten König <carstenkoenig92@gmail.com>
pkgname=elasticvue-bin
options=('!debug')
pkgver=1.11.1
pkgrel=1
url="https://github.com/cars10/elasticvue"
license=('MIT')
arch=('x86_64')
source=(
	"https://github.com/cars10/elasticvue/releases/download/v${pkgver}/elasticvue"
	"https://raw.githubusercontent.com/cars10/elasticvue/refs/heads/master/src/assets/images/logo/blue_96.png"
	"local://elasticvue.desktop"
)
sha256sums=('02576df989fd0c531c8ab28e7d0a9dc0093f713514fe0372e5e9130c59e08696'
            '81ea0848c8e3acaa6d1a45725494c3a9117517fda69dac3cda2e80a6e8af0e71'
            'd5a7e0fed82f18ee51dac0258ba5070f145a18c4aa3235c0803afe1351043352')

package() {
	install -D -m644 blue_96.png -T "${pkgdir}/usr/share/pixmaps/elasticvue.png"
	install -D -m644 elasticvue.desktop -T "${pkgdir}/usr/share/applications/elasticvue.desktop"
	install -D -m755 elasticvue -T "${pkgdir}/usr/bin/elasticvue"
}
