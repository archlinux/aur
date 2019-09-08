# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>

pkgname=rss2email
pkgver=3.10
pkgrel=1
pkgdesc='A tool for delivering news from RSS feeds to your email program'
arch=('any')
url='https://github.com/rss2email/rss2email'
license=('GPL')
depends=('python' 'python-html2text' 'python-feedparser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('922b33f5bc3bce20568b977bff84dfdef3f1f7117fc70cc0b1bee7daa0e0acac')

package() {
	cd "${pkgname}-${pkgver}"

	python setup.py install --root="${pkgdir}"
}
