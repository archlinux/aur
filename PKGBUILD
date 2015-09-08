# Maintainer: Sakari Kapanen <sakari.m.kapanen@gmail.com>

pkgname='blank-html-server'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Serves blank HTML pages using Node.js'
url='https://gist.github.com/flannelhead/e1d9b5b10669e702b92a'
arch=('any')
license=('GPL3')
depends=('nodejs')

source=('blank-html-server'
        'blank-html-server.service')
md5sums=('8d78b5b0866b2fa886b14f6bc96ed19d'
         '68c2b3a104aaee59907163b3527c6a58')

package() {
    cd $srcdir

    install -D -m 0755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m 0644 "${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
}
