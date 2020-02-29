# Maintainer: Kim Nordmo <kim.nordmo@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=edx-dl
pkgver=0.1.13
pkgrel=1
pkgdesc='Tool to download videos and lecture materials from Open edX-based sites'
arch=(any)
url=https://github.com/coursera-dl/edx-dl
license=(LGPL3)
depends=(
  python-beautifulsoup4
  python-html5lib
  python-six
  youtube-dl
  python-requests
)
conflicts=(edx-downloader-git)
source=(edx-dl-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('63641018f282111d4213d924228589eb801ab27aa30e41af2d6c74e4f962500af88947c25a45d50723a49eb458bc0f9047b2ee82e3a979ea4dba762693f08fb3')

package() {
  cd edx-dl-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
