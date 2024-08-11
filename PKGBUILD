# Maintainer: Tobias Leupold <tl at stonemx dot de>
pkgname=smartmontools-openrc
pkgver=20240811
pkgrel=1
pkgdesc="OpenRC smartmontools init script"
arch=( "any" )
license=( "GPL2" )
groups=( "openrc-system" )
provides=( "init-smartmontools" )
depends=( "openrc" "smartmontools" )
conflicts=( "init-smartmontools" )
source=( "smartd.initd" )
sha256sums=( "acef10e3d963a97c32f525da730eac00be424e7588ab2d7b24ad24dfe032ac88" )

package()
{
    install -Dm755 "$srcdir/smartd.initd" "$pkgdir/etc/init.d/smartd"
}
