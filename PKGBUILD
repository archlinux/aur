pkgname=fsplayer
pkgver=0.3
pkgrel=1
pkgdesc="FS.TO video player built in Python & GTK3."
arch=('any')
url="http://github.com/and3rson/fsplayer"
license=('GPL2')
depends=('python2' 'gtk3' 'python2-beautifulsoup4' 'python2-selenium' 'gobject-introspection-runtime')
options=('!strip')
source=('git+https://github.com/and3rson/fsplayer.git')

package() {
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/lib
    cp -r ${srcdir}/${pkgname} ${pkgdir}/usr/lib/${pkgname}
    ln -s /usr/lib/${pkgname}/main.py ${pkgdir}/usr/bin/${pkgname}
}

md5sums=('SKIP')
