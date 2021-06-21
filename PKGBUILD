# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>

pkgname=rss2email
pkgver=3.13.1
pkgrel=1
pkgdesc='A tool for delivering news from RSS feeds to your email program'
arch=('any')
url='https://github.com/rss2email/rss2email'
license=('GPL')
depends=('python' 'python-html2text' 'python-feedparser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4fcf43c6e34cfb8fd9d1803b44b9059c3b7cfed02f9b09b48b3bfe3fa1e0c30c')

package() {
	cd "${pkgname}-${pkgver}"

	python setup.py install --root="${pkgdir}"
}
