# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-woman-cycle-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell cycle tracker: periods, ovulation, symptoms — data stays on the device'
depends=('synshell-core')
provides=('syn-woman-cycle')
conflicts=('syn-woman-cycle' 'syn-woman-cycle-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-woman-cycle-0.2.0-x86_64.tar.zst' 'syn-woman-cycle-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-woman-cycle-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-woman-cycle-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('c310d62727ef67c0e3d452cfd00b6e958dc77b8d77405e864d8bbc33ed54fe72')
source_aarch64=("syn-woman-cycle-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-woman-cycle-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('e67791e3f58f2c9a3878defff163e9fe4e83354bd03d5ade5f5d23bfc53680f2')

package() {
    bsdtar -xpf "$srcdir/syn-woman-cycle-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
