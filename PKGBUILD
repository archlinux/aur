# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syncamera-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell camera: photos, video, night mode'
depends=('synshell-core')
provides=('syncamera')
conflicts=('syncamera' 'syncamera-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syncamera-0.2.0-x86_64.tar.zst' 'syncamera-0.2.0-aarch64.tar.zst')
source_x86_64=("syncamera-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syncamera-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('db7138f21e5b13cc20fdb5dc8fa553c4769242e0195b3d03e10c09943bad1f43')
source_aarch64=("syncamera-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syncamera-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('59af137217a6adde2cffd80d556ad10e9fec502dfeafb641776c87cef8893f59')

package() {
    bsdtar -xpf "$srcdir/syncamera-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
