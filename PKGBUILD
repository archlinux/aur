pkgname="feed2tweet"
pkgver=1.1
pkgrel=2
pkgdesc="Parse rss feed and tweet new posts to Twitter"
url="https://gitlab.com/chaica/feed2tweet"
arch=('any')
license=('GPL3')
depends=('python' 'python-persistentlist' 'python-tweepy' 'python-feedparser')
makedepends=('python' 'python-setuptools')
source=(
    "https://files.pythonhosted.org/packages/b5/4f/d7254341629ac5e73e0222efbbbf22adc8143f34366346b46df112b9110e/feed2tweet-1.1.tar.gz"
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

sha256sums=("d15e35ef8a34b6475af5afb45f38c362eff47163905a5ba781896366bf274a9f")
