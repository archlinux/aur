pkgname=laravel-bin
pkgver=5.28.1
pkgrel=1
pkgdesc="Laravel installation based on the official herd lite installer (https://php.new/install/linux/8.4). Only includes the laravel executable"
arch=('x86_64')
depends=('php' 'composer')
url="https://download.herdphp.com/resources/laravel"
license=('MIT')
install=laravel-bin.install

package() {
    install -d "$pkgdir/$HOME/.config/herd-lite/bin"

    # Download Laravel
    curl -L "https://download.herdphp.com/resources/laravel" \
        -o "$pkgdir/$HOME/.config/herd-lite/bin/laravel"

    chmod +x "$pkgdir/$HOME/.config/herd-lite/bin/laravel"
}
