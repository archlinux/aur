# Maintainer: nephitejnf <nephitejnf@gmail.com>
pkgname=lightcord-bin
pkgver=v0.1.3
pkgrel=1
pkgdesc="A simple - customizable - Discord Client"
arch=("x86_64")
url="https://github.com/Lightcord/Lightcord"
license=('MIT')
depends=()
makedepends=()
source=("$pkgname-$pkgver.zip::https://lightcord.deroku.xyz/api/v1/gh/releases/Lightcord/Lightcord/$pkgver/lightcord-linux-x64.zip")
md5sums=("SKIP")

package() {
    install -d "$pkgdir"/usr/share/lightcord
    install -d "$pkgdir"/usr/bin
    cp -a "$srcdir"/. "$pkgdir"/usr/share/lightcord
    chmod 755 "$pkgdir"/usr/share/lightcord/Lightcord
    ln -s /usr/share/lightcord/Lightcord "$pkgdir"/usr/bin/lightcord
}
