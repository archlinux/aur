pkgname=potato
pkgver=5
pkgrel=1
pkgdesc="A pomodoro timer for the shell"
arch=('any')
url="https://github.com/Bladtman242/potato"
license=('MIT')
depends=('alsa-utils')
source=('potato.sh'
        'LICENSE')
md5sums=('d70c9e67e370f0507c4f7ef7b13d02b7'
         '1ddcbd2862764b43d75fb1e484bf8912')
package() {
	install -D $srcdir/potato.sh $pkgdir/usr/bin/$pkgname
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
