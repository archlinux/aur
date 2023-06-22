# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
# Contributor: Emilio Reggi <nag@mailbox.org>
# Contributor: Mubashshir <ahmubashshir@gmail.com>
pkgname=update-notifier
pkgver=0.7.7
pkgrel=5
pkgdesc="A simple pacman update notifier"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=('custom:MIT')
depends=('awk'
        'dunst>=1.3.2-2'
        'libnotify'
        'bash')
optdepends=('yaourt: for AUR support'
        'gnome-terminal: for integration with gnome-update-notifications'
        'pamac: for graphical update actions'
        'yay: for AUR support'
        'trizen: for AUR support'
        'pacaur: for AUR support')
makedepends=('git')
source=("git+https://github.com/Chrysostomus/$pkgname")
md5sums=('SKIP')

package () {
        cd "$srcdir"
        install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
        install -Dm755 "$srcdir/$pkgname/update-notifier" "$pkgdir/usr/bin/update-notifier"
        install -Dm755 "$srcdir/$pkgname/update-checker" "$pkgdir/usr/bin/update-checker"
        install -Dm755 "$srcdir/$pkgname/update-check" "$pkgdir/usr/bin/update-check"
        install -Dm755 "$srcdir/$pkgname/update-command" "$pkgdir/usr/bin/update-command"
        install -Dm755 "$srcdir/$pkgname/update-help" "$pkgdir/usr/bin/update-help"
}
