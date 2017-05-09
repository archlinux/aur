# MainTainer: Sherlock Holo <sherlockya(at)gmail.com>

pkgname=aria-ng-deploy
_pkgname=AriaNg-DailyBuild
pkgver=20170509
pkgrel=1
pkgdesc="AriaNg, A Better Web Frontend for aria2 (out of box version)"
arch=('any')
url="https://github.com/mayswind/AriaNg-DailyBuild"
license=('MIT')
depends=('aria2')
makedepends=('git')
conflicts=('aria-ng-git')
source=("git://github.com/mayswind/AriaNg-DailyBuild.git")
md5sums=('SKIP')

install=$pkgname.install

package(){
        cd "$srcdir/"

        mkdir -p "$pkgdir/usr/share"
        cp -r "$_pkgname" "$pkgdir/usr/share/$pkgname"
}
