# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
pkgname=hyprshot
pkgver=1.2.3
pkgrel=1
url="https://github.com/Gustash/Hyprshot"
pkgdesc="A utility to easily take screenshots in Hyprland using your mouse"
arch=('any')
license=('GPL')
depends=('bash' 'jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify')
provides=("$pkgname")
conflicts=("$pkgname")
source=("Hyprshot-$pkgver.tar.gz::https://github.com/Gustash/Hyprshot/archive/$pkgver.tar.gz")
sha512sums=('f4f762e1063c5374dd1a9bfc697b9578be7d2a625cbb95224cc1b54142290ae466adc85eb0a6bd7eba81d3228a592bd8b1a5f9d34a407efa14378d668fa525da')

package() {
    cd "Hyprshot-$pkgver"
    mkdir -p "$pkgdir/usr/bin"

    cp hyprshot "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
