# Maintainer: 32exe <32exe@proton.me>
pkgname=web-archer-bin
pkgver=1.2.0
pkgrel=2
pkgdesc="A bug-fixed, multi-threaded text scraper and website crawling tool. (Pre-packaged Source)"
arch=('any')
url="https://github.com/32archusers/web-archer"
license=('MIT')
depends=('python' 'python-curl_cffi' 'python-ddgs')
provides=('web-archer')
conflicts=('web-archer' 'web-archer-git')
source=("https://github.com/32archusers/web-archer/archive/refs/tags/v1.2.0.tar.gz")

sha256sums=('83c7778725fe952cbffe4259cba4e8d48fa49a2d0082bc31d809ccb22710b156')

package() {
    cd "${srcdir}/web-archer-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
