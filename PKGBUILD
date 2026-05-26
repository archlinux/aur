# Maintainer: 32exe <32exe@proton.me>
pkgname=web-archer-bin
pkgver=1.4
pkgrel=1
pkgdesc="A bug-fixed, multi-threaded text scraper and website crawling tool. (Pre-packaged Source)"
arch=('any')
url="https://github.com/32archusers/web-archer"
license=('MIT')
depends=('python' 'python-curl_cffi' 'python-ddgs')
provides=('web-archer')
conflicts=('web-archer' 'web-archer-git')
source=("https://github.com/32archusers/web-archer/archive/refs/tags/1.4.tar.gz")

sha256sums=('9ac5e50e0ba87e81cb77af4241916b2cc7ef33d1fed4cb354ff3ad882a263282')

package() {
    cd "${srcdir}/web-archer-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
