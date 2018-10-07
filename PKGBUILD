# MainTainer: Sherlock Holo <sherlockya(at)gmail.com>

pkgname=aria-ng-deploy
_pkgname=AriaNg-DailyBuild
pkgver=20181006
pkgrel=1
pkgdesc="AriaNg, A Better Web Frontend for aria2 (out of box version)"
arch=('any')
url="https://github.com/mayswind/AriaNg-DailyBuild"
license=('MIT')
depends=('aria2')
optdepends=('apache: apache provide web service'
            'nginx: nginx provide web service'
            'caddy: caddy provide web service')
makedepends=('git')
conflicts=('aria-ng-git')
source=("git+https://github.com/mayswind/AriaNg-DailyBuild.git"
        "$pkgname.install")
md5sums=('SKIP'
         '3d639428f93a691cf6d4133a0cbb08fb')

install=$pkgname.install

package(){
        cd "$srcdir/"

        mkdir -p "$pkgdir/usr/share"
        cp -r "$_pkgname" "$pkgdir/usr/share/$pkgname"
}
