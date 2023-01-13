pkgname=quassel-core-openrc
pkgver=20220729
pkgrel=1
pkgdesc="OpenRC quassel-core init script"
arch=( "any" )
license=( "GPL2" )
groups=( "openrc-system" )
provides=( "init-quassel-core" )
depends=( "openrc" "quassel-core" )
conflicts=( "init-quassel-core" )
backup=( "etc/conf.d/quasselcore" )
source=( "quasselcore.initd"
         "quasselcore.confd" )
sha256sums=( "2999c0a190238aa9e2a61729de910423ab8caef18ee9d22fb1ce6916020fff76"
             "7d7ea29e58f49a0cc56aa3df4cc54814a67510169ce6cefad7ad5e5493671df7" )

package()
{
    install -Dm755 "$srcdir/quasselcore.initd" "$pkgdir/etc/init.d/quasselcore"
    install -Dm644 "$srcdir/quasselcore.confd" "$pkgdir/etc/conf.d/quasselcore"
}
