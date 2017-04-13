pkgname="feed2tweet"
pkgver=1.1
pkgrel=1
pkgdesc="Parse rss feed and tweet new posts to Twitter"
url="https://github.com/chaica/feed2tweet"
arch=('any')
license=('GPL3')
depends=('python' 'python-persistentlist' 'python-tweepy' 'python-feedparser')
makedepends=('python' 'python-setuptools')
source=(
    "https://github.com/chaica/${pkgname}/archive/$pkgver.tar.gz"
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('be9c09c1c8f2be360240661173421d02')
