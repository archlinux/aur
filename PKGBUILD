pkgname='cron-sentry'
pkgver=0.6.3
pkgrel=1
pkgdesc="Crontab sentry error reporter"
url="https://github.com/yipit/cron-sentry"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://github.com/Yipit/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('28d760488215dc0153aa7b2bffd6bbf4')
