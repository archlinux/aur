# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synshell-ai-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell: assistant — chats, voice mode, tools (needs the synaptix service)'
depends=('synshell-core' 'synaptix')
provides=('synshell-ai')
conflicts=('synshell-ai' 'synshell-ai-git')
options=('!strip' '!debug')
noextract=('synshell-ai-0.2.0-x86_64.tar.zst' 'synshell-ai-0.2.0-aarch64.tar.zst')
source_x86_64=("synshell-ai-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synshell-ai-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('c903804c959bf1a408cf3723155a3fdef5d4137985d971657fde4ece4876199c')
source_aarch64=("synshell-ai-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synshell-ai-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('223a34b32c5dc230abf90c2a10efdfb874252fe687929927d2dd2f6e78441730')

package() {
    bsdtar -xpf "$srcdir/synshell-ai-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
