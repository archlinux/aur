# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname="mkdocs-static-i18n-plugin"
pkgver=0.46
pkgrel=1
pkgdesc="MkDocs i18n plugin using static translation markdown files"
url="https://github.com/ultrabug/mkdocs-static-i18n"
license=("MIT")
arch=("any")
replaces=("python-mkdocs-rss-plugin-plugin")
depends=("mkdocs")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('977c7f2335f9c5f26730b7c7b35f55d929ccaab112a11968bf31a57882d12498')

build(){
 cd "mkdocs-static-i18n-$pkgver"
 python setup.py build
}

package(){
 cd "mkdocs-static-i18n-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
