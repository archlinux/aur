# Maintainer: Emil Hammarberg emilhammarberg@mailbox.org
pkgname=patata-git
pkgver=7
pkgrel=1
pkgdesc="A pomodoro timer for the shell"
arch=('any')
url="https://github.com/emiham/patata"
license=('MIT')
depends=('alsa-utils')
optdepends=('notify-send')
makedepends=('git')
sha256sums=('SKIP')
source=("git+https://github.com/emiham/patata.git")
package() {
	install -D $srcdir/patata/patata.sh $pkgdir/usr/bin/${pkgname%-git}
	install -D -m644 $srcdir/patata/LICENSE $pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE
	install -D $srcdir/patata/notification.wav $pkgdir/usr/lib/${pkgname%-git}/notification.wav
}
