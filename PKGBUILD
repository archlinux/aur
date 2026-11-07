# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synshell-game-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell: game mode (full-screen gamepad shell) and on-screen controller'
depends=('synshell-core')
provides=('synshell-game')
conflicts=('synshell-game' 'synshell-game-git')
options=('!strip' '!debug')
noextract=('synshell-game-0.2.0-x86_64.tar.zst' 'synshell-game-0.2.0-aarch64.tar.zst')
source_x86_64=("synshell-game-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synshell-game-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('f7191d77c725d11f5678e3d5e4e2d6e75e95aade514587d522400a56a1e01fb4')
source_aarch64=("synshell-game-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synshell-game-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('932b6f4be3af92b211433e402d3827691b07cce593cc9ac0b51fcd838769ab5e')

package() {
    bsdtar -xpf "$srcdir/synshell-game-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
