# Maintainer: Michal Salaban <michal@salaban.info>
pkgname=python2-webapp2
pkgver=2.5.1
pkgrel=1
pkgdesc="A lightweight Python web framework compatible with Google App Engine’s"
arch=('any')
url="https://github.com/GoogleCloudPlatform/webapp2"
license=('Apache')
groups=()
depends=('python2' 'python2-webob')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/webapp-improved/webapp2-$pkgver.zip")
md5sums=('9d0f997ffc0fbddba4a829df9d0bd821')

package() {
	cd "webapp2-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
