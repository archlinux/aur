# Maintainer: Gustavo Coutinho de Souza <aur at onemoresuza dot mailer dot me>
# shellcheck disable=2034,2154

pkgname='pass-context'
pkgver='0.4.3'
pkgrel=1
pkgdesc='A pass extension to easily switch between pass contexts'
arch=('any')
url='https://gitlab.com/onemoresuza-pass/pass-context'
license=('GPL3')
depends=('pass')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/api/v4/projects/43562293/packages/generic/pass-context/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('3b1a40d182cdc69106bcc5c95b4044052c38d4e0ad8627f4c86607f406a00fe415643a29caed870e27bca37dc34707eee546ce3c390764dd42be7f36c67a8c27')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 1

	make DESTDIR="${pkgdir}" install
}
