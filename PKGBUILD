# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='python2-cfscrape'
pkgver='1.6.4'
pkgrel=1
pkgdesc="A simple Python module to bypass Cloudflare's anti-bot page"
arch=('x86_64')
url='https://github.com/eudemonics/cloudget'
license=('unknown')
depends=('python2' 'python2-pip' 'python2-pyexecjs')
source=('https://pypi.python.org/packages/35/b1/eb0f1d428d5d547a7fad7c0874d63a6ba1171ea6dbc7091eec9ecbb0c7cf/cfscrape-1.6.4.tar.gz')
sha256sums=('86cd1e32c28db9a5b166f79c73eb89b798087c5ec80cf10adc2c2b430f8bd604')


package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	pip2 install --isolated --root="${pkgdir}" --no-deps --ignore-installed .
}
