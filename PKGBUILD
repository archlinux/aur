# Maintainer: 32exe <32exe@proton.me>
pkgname=web-archer-bin
pkgver=1.4
pkgrel=2
pkgdesc="A bug-fixed, multi-threaded text scraper and website crawling tool. (Pre-packaged Source)"
arch=('any')
url="https://github.com/32archusers/web-archer"
license=('MIT')
depends=('python' 'python-curl_cffi' 'python-ddgs')
provides=('web-archer')
conflicts=('web-archer' 'web-archer-git')
source=("https://github.com/32archusers/web-archer/archive/refs/tags/1.4.tar.gz")

sha256sums=('c4f46ef92169bd9b8882083731c6508ed4f27717dd95fb38672e3d3a84b61644')

package() {
    cd "${srcdir}/web-archer-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
