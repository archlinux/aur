# Maintainer: Midov <midov@midov.pl>

pkgname=pantalaimon
pkgver=0.2
pkgrel=1
pkgdesc='Pantalaimon is an end-to-end encryption aware Matrix reverse proxy daemon.'
arch=('any')
url='https://github.com/matrix-org/pantalaimon'
license=('Apache')
depends=('python' 'libolm' 'matrix-nio-git' 'python-prompt_toolkit' 'python-janus' 'python-peewee' 'python-logbook' 'python-aiohttp' 'python-cachetools' 'python-pycryptodome' 'python-unpaddedbase64' 'python-h2' 'python-h11' 'python-notify2' 'python-pydbus')
source=("https://github.com/matrix-org/pantalaimon/archive/${pkgver}.tar.gz")
sha256sums=('30eb448eacf6c02078bd3c58513bc426ec09fa9930833e711270eaa8abc13756')

build() {
	cd "${pkgname}-${pkgver}"
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir"
}

