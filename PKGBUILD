# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synpass-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell password manager'
depends=('synshell-core')
provides=('synpass')
conflicts=('synpass' 'synpass-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('synpass-0.2.0-x86_64.tar.zst' 'synpass-0.2.0-aarch64.tar.zst')
source_x86_64=("synpass-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synpass-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('6b4f7eed218740322aeb6aff55e92d57668ecbf494ff5591836c7c245711c0b2')
source_aarch64=("synpass-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synpass-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('4c015d53d77a2b4e7ccbde59d4d3e73b693db49842e2d198f3f15eef6dd2ffc2')

package() {
    bsdtar -xpf "$srcdir/synpass-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
