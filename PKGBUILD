# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='ruby-mixlib-cli'
pkgver='1.6.0'
pkgrel=1
pkgdesc='Provides a class-based command line option parsing object'
arch=('any')
url='https://github.com/chef/mixlib-cli'
license=('Apache2')
depends=('ruby' 'ruby-bundler')
source=('git://github.com/chef/mixlib-cli')
sha256sums=('SKIP')


package() {
	        cd "${srcdir}/mixlib-cli"
	        bundle install --path="${pkgdir}"
}
