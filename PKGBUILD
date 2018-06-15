# Maintainer: Joffrey <j-off@live.fr>

pkgname='python2-rjsmin'
pkgver='1.0.12'
pkgrel=1
pkgdesc='rJSmin is a javascript minifier written in python'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/ndparker/rjsmin'
license=('Apache')
depends=('python2>=2.4')
source=("https://github.com/ndparker/rjsmin/archive/$pkgver.tar.gz")
sha256sums=('cc44516dbdac13219179765f0b2a847e92ecb03d3c40fbec2da0aeb711e1c25f')

package() {
	cd "$srcdir/rjsmin-$pkgver"
	python2 './setup.py' install --root="$pkgdir" --optimize=1 # --without-c-extensions
}
