# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>

pkgname=rss2email
pkgver=3.12.1
pkgrel=1
pkgdesc='A tool for delivering news from RSS feeds to your email program'
arch=('any')
url='https://github.com/rss2email/rss2email'
license=('GPL')
depends=('python' 'python-html2text' 'python-feedparser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ec70c7e1b89994c9a65612f97c9662a1198d23c6ceeab52bd51e03327120005d')

package() {
	cd "${pkgname}-${pkgver}"

	python setup.py install --root="${pkgdir}"
}
