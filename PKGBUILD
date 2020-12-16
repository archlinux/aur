# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>

pkgname=rss2email
pkgver=3.12.2
pkgrel=1
pkgdesc='A tool for delivering news from RSS feeds to your email program'
arch=('any')
url='https://github.com/rss2email/rss2email'
license=('GPL')
depends=('python' 'python-html2text' 'python-feedparser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b9a1523e6709eaa701c348090d36c9c010b62d8448f0f4c5e16dfaaa8f19783a')

package() {
	cd "${pkgname}-${pkgver}"

	python setup.py install --root="${pkgdir}"
}
