# Maintainer: oi_wtf <brainpower@mailbox.org>


pkgname="systemd-daemon-reload-hook"
pkgver=1
pkgrel=1
pkgdesc="pacman hook to run 'systemctl daemon-reload' on updates to system unit files"
arch=('any')
license=('custom:CC0')
depends=('systemd')
url="https://aur.archlinux.org/packages/$pkgname/"

source=("systemd-daemon-reload.hook"
        "https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt")
sha256sums=('c11ce16104207add37ca69a7e1dd5825a3c5c30ea906e7cbc6766a66d6a0307a'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

package(){
	install -Dm644 "$srcdir"/systemd-daemon-reload.hook "$pkgdir"/usr/share/libalpm/hooks/systemd-daemon-reload.hook
	install -Dm644 "$srcdir"/legalcode.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
