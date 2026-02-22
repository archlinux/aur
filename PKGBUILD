pkgname=arch-autoupdater
pkgver=1.0
pkgrel=1
pkgdesc="Auto background updater for Arch Linux with popup notifications"
arch=('any')
url="https://github.com/codmasterhem-sudo/arch-autoupdater"
license=('MIT')
depends=('python' 'zenity')
source=("https://raw.githubusercontent.com/codmasterhem-sudo/arch-autoupdater/main/arch-autoupdater.py")
sha256sums=('SKIP')

package() {
    install -Dm755 arch-autoupdater.py "$pkgdir/usr/bin/arch-autoupdater"
}
