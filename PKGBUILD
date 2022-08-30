# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>

pkgname=rss2email
pkgver=3.14
pkgrel=1
pkgdesc='A tool for delivering news from RSS feeds to your email program'
arch=('any')
url='https://github.com/rss2email/rss2email'
license=('GPL')
depends=('python' 'python-html2text' 'python-feedparser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ea09b68f6a5421b0bd50e98e24d49a0a33bd54a5f59d0f1be1f6f3f05b8c6087')

package() {
	cd "${pkgname}-${pkgver}"

	python setup.py install --root="${pkgdir}"
}
