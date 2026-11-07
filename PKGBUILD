# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-blocks-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell puzzle game with blocks'
depends=('synshell-core')
provides=('syn-blocks')
conflicts=('syn-blocks' 'syn-blocks-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-blocks-0.2.0-x86_64.tar.zst' 'syn-blocks-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-blocks-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-blocks-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('9844b52d21c11897421113206c029481008b25c1df000f636315867a47cbaba8')
source_aarch64=("syn-blocks-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-blocks-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('8ca2b718eabe39497cdadc751da9741c1a7d2f275dd113c9494ed58c2fb033ee')

package() {
    bsdtar -xpf "$srcdir/syn-blocks-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
