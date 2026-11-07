# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syndroid-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell Android container: run Android apps on the desktop'
depends=('synshell-core')
provides=('syndroid')
conflicts=('syndroid' 'syndroid-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syndroid-0.2.0-x86_64.tar.zst' 'syndroid-0.2.0-aarch64.tar.zst')
source_x86_64=("syndroid-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syndroid-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('cd4bddc03476c82f70300594f6ab0dc0ffc5357ccef6f2a3f47fe8786769c6d3')
source_aarch64=("syndroid-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syndroid-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('37b5556b113eb465ebacedb1eeeb08151798185e662cfb734a2a8cc9e33e29ab')

package() {
    bsdtar -xpf "$srcdir/syndroid-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
