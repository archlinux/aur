# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=loggerhead-wsgi
pkgver=0.0.1
pkgrel=3
pkgdesc='Loggerhead (bzr web interface) wsgi script'
arch=('any')
url='http://blog.projectfondue.com/2009/11/26/loggerhead-and-mod-wsgi'
license=('GPL')
depends=('mod_wsgi2' 'loggerhead' 'python2-paste-deploy')
source=('loggerhead.wsgi')
sha256sums=('89219c91a00571e583bc5baf123dc37c867c2f1af7f02b6cbd03b1cf6cc7e937')

package() {
	install -D -m0755 ${srcdir}/loggerhead.wsgi ${pkgdir}/srv/http/bzr/loggerhead.wsgi
}

