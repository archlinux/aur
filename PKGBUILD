# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=python-twtxt
pkgver=1.2.1
pkgrel=1
pkgdesc='Decentralised, minimalist microblogging service for hackers'
arch=('any')
url='https://github.com/buckket/twtxt'
license=('MIT')
depends=('python-six' 'python-dateutil' 'python-chardet' 'python-aiohttp'
         'python-click' 'python-humanize')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/twtxt/twtxt-1.2.1.tar.gz")
sha256sums=('b6c892655f2fb7efd183410a0071830a1df70185d3ac6bf657afeb812a5cacb4')

prepare() {
  cp -r twtxt-${pkgver} python-twtxt-${pkgver}
}

package() {
  cd python-twtxt-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize='1'
}
