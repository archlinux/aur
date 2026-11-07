# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-remote-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell remote control: IR blaster and smart TVs'
depends=('synshell-core')
provides=('syn-remote')
conflicts=('syn-remote' 'syn-remote-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-remote-0.2.0-x86_64.tar.zst' 'syn-remote-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-remote-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-remote-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('8ad747c0b384712e4caa7ec75f498fd1ebdd2086d6a236ab45781e599d609d7a')
source_aarch64=("syn-remote-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-remote-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('3496b10dd329daa4c9dd1e565c402ea7a1da7ce6b0e2cd105c93df24f2ac2500')

package() {
    bsdtar -xpf "$srcdir/syn-remote-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
