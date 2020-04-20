# Maintainer: Yury Bondarenko < ybnd at tuta dot io >

pkgname=git-annex-adapter
pkgver=0.2.1
pkgrel=0
pkgdesc='Call git-annex commands from Python'
url='https://github.com/alpernebbi/git-annex-adapter'
license=('GPL3')
arch=('any')
depends=('git-annex' 'python-pygit2')
makedepends=('python-setuptools')
source=("https://github.com/alpernebbi/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('218736e8eee4b9200a4a76aae7e0f0c98feb1e91ca6dcf0132c83e8c2614bd3b')



package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
