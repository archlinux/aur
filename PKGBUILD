# Maintainer: Donato Foglia <fogliadonato2@gmail.com>
pkgname=nexus-aur-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Un gestore di pacchetti grafico per Arch Linux e AUR scritto in Flutter"
arch=('x86_64')
url="https://github.com/IlNinjaDiBattipaglia/Nexus-AUR"
license=('MIT')
depends=('gtk3' 'glib2' 'util-linux' 'yay')
provides=('nexus-aur')
conflicts=('nexus-aur')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IlNinjaDiBattipaglia/Nexus-AUR/releases/download/v$pkgver/nexus-aur-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/nexus_aur"
    cp -r * "$pkgdir/opt/nexus_aur/"
    ln -s /opt/nexus_aur/nexus_aur "$pkgdir/usr/bin/nexus-aur"
}
