pkgname=jaro
pkgver=0.5.5
pkgrel=1
pkgdesc="a highly customizable xdg-open alternative"
arch=('any')
url="https://github.com/isamert/jaro"
license=('GPL-3')
depends=("guile")
source=("https://github.com/isamert/${pkgname}/archive/v${pkgver}.zip")
sha512sums=('4eb66c099cb19c72ef66b93125b1d9bdc63f4180a4343062904467212aa1015fd2ef7fa48edd2b81475c357e9706c754cc7f5dfbee9297de38b152fdf096ae4e')

package(){
		mkdir -p "${pkgdir}/usr/bin"

		install -Dm 755 $srcdir/${pkgname}-$pkgver/jaro ${pkgdir}/usr/bin/jaro
		install -Dm 644 $srcdir/${pkgname}-$pkgver/data/jaro.desktop ${pkgdir}/usr/share/applications/jaro.desktop
}
