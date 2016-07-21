# Maintainer: Thomas Fanninger <thomas AT fanninger DOT at>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python-yowsup'
pkgver=2.5.0
pkgrel=1
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('GPL')
depends=('python' 'python-dateutil' 'python-argparse' 'python-axolotl' 'python-pillow')
makedepends=('python-setuptools')
provide=('python-yowsup')
conflicts=('yowsup-client-git' 'python-yowsup-git')
source=("${pkgname}::https://github.com/tgalal/yowsup/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/yowsup-${pkgver}"
  python setup.py install --root="$pkgdir/"
}