# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-maps-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell maps'
depends=('synshell-core')
provides=('syn-maps')
conflicts=('syn-maps' 'syn-maps-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-maps-0.2.0-x86_64.tar.zst' 'syn-maps-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-maps-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-maps-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('d470296773733bd17890581f943b8e046996a2a617cf40f089ed3489d995e57b')
source_aarch64=("syn-maps-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-maps-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('7fab2ca64df4d948227d257824ff9ecf8a9df696ef5cf9333d11f47cea3eab89')

package() {
    bsdtar -xpf "$srcdir/syn-maps-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
