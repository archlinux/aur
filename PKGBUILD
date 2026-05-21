# Maintainer: 32exe <32exe@proton.me>
pkgname=web-archer-bin
pkgver=1.4.stable
pkgrel=1
pkgdesc="A bug-fixed, multi-threaded text scraper and website crawling tool. (Pre-packaged Source)"
arch=('any')
url="https://github.com/32archusers/web-archer"
license=('MIT')
depends=('python' 'python-curl_cffi' 'python-ddgs')
provides=('web-archer')
conflicts=('web-archer' 'web-archer-git')
source=("https://github.com/32archusers/web-archer/archive/refs/tags/v1.4.stable.tar.gz")

sha256sums=('SKIP')

package() {
    cd "${srcdir}/web-archer-1.4.stable"
    python setup.py install --root="${pkgdir}" --optimize=1
}
