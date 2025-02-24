# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: vinicentus
# Based on package by Jelle van der Waa <jelle vdwaa nl>.
pkgname=networkmanager-dispatcher-chrony
pkgver=2.1
pkgrel=2
pkgdesc="Dispatcher Script for chrony"
arch=(any)
license=('MIT')
url='https://wiki.gnome.org/Projects/NetworkManager'
depends=('networkmanager' 'chrony')
backup=(etc/NetworkManager/dispatcher.d/10-chrony)
changelog=ChangeLog
source=('10-chrony' 'LICENSE')
sha256sums=('3af238e64049b60b32e46094fa9d42ed92192e8dee0989ac473de70b28e9fb51'
            '453e6920a08aa104baf245c81568050d075379af3944ae92b03d46d01e37d6cf')

package() {
  install -Dm755 "$srcdir/10-chrony" "$pkgdir/etc/NetworkManager/dispatcher.d/10-chrony"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
