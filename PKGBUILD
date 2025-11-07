pkgname=adhan-live
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple Adhan reminder script"
url="https://github.com/enzoxwashere/Adhan-Reminder"
license=('MIT')
arch=('any')
depends=('python')
source=("https://raw.githubusercontent.com/enzoxwashere/Adhan-Reminder/main/adhan-live.py"
        "https://raw.githubusercontent.com/enzoxwashere/Adhan-Reminder/main/a1.mp3")
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 adhan-live.py "$pkgdir/usr/bin/adhan-live"
    install -Dm644 a1.mp3 "$pkgdir/usr/share/adhan-reminder/a1.mp3"
}

