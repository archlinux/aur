pkgname=vkplayer
pkgver=0.4
pkgrel=1
pkgdesc="VK audio player built in Python & GTK3."
arch=('any')
url="http://github.com/and3rson/vkplayer"
license=('GPL2')
depends=('python2' 'gtk3' 'libkeybinder3' 'webkitgtk' 'gobject-introspection-runtime' 'python2-dbus' 'python2-pyglet' 'redis')
options=('!strip')
source=('git+https://github.com/and3rson/vkplayer.git')

package() {
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/lib
    cp -r ${srcdir}/${pkgname}/${pkgname} ${pkgdir}/usr/lib/${pkgname}
    ln -s /usr/lib/${pkgname}/main.py ${pkgdir}/usr/bin/${pkgname}
}

md5sums=('SKIP')
