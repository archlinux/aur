# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=edx-dl
pkgver=0.1.11
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
sha512sums=('50b6902f131a99dfba2b41a140989d2d519cd02d25b9184e320454be282912638833c04fb36962c17fc7633c6c48331c00e524cc1908c4c0bc857e00f0200672')

package() {
  cd edx-dl-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
