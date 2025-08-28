# Maintainer: mklan <me@klanm.at>
pkgname=hyproled-git
pkgver=0.1.3
pkgrel=5
pkgdesc="A hyprland shader utility to prevent OLED burn in."
arch=('any')
url="https://github.com/mklan/hyproled"
license=('BSD 3')
depends=('hyprland' 'bash')
makedepends=('git')
source=("git+https://github.com/mklan/hyproled.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/hyproled"
    install -Dm755 hyproled "$pkgdir/usr/bin/hyproled"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyproled/LICENSE"
}
