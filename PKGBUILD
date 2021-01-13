# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=outline-manager-appimage
pkgver=1.5.3_rc1
pkgrel=1
pkgdesc="Creates and manages Outline servers, powered by Shadowsocks."
arch=('x86_64')
url="https://github.com/Jigsaw-Code/outline-server"
license=('Apache')
makedepends=('git')
provides=('outline-manager')
conficts=('outline-manager')
source=("https://github.com/Jigsaw-Code/outline-server/releases/download/server-v${pkgver/_/-}/Outline-Manager.AppImage")
b2sums=('da687d42993cab1ed6848da703eafe31143989a3751e588e37aa3b349987900c303df40e08589e10c87667a548c4d510b4307e7e6f43a29eec0b3c1333c94062')

package() {
 install -Dm755 -t $pkgdir/opt/outline-manager/ $srcdir/Outline-Manager.AppImage
 mkdir -p $pkgdir/usr/bin
 ln -sf /opt/outline-manager/Outline-Manager.AppImage $pkgdir/usr/bin/outline-manager
}
