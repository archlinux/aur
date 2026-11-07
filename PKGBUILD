# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-wine-helper-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell Wine helper: run Windows games and programs'
depends=('synshell-core')
provides=('syn-wine-helper')
conflicts=('syn-wine-helper' 'syn-wine-helper-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-wine-helper-0.2.0-x86_64.tar.zst' 'syn-wine-helper-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-wine-helper-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-wine-helper-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('dcf9d3a36c1ba4f07a9842f1c7dbafb1bece188f7ba7fdb0256a04a6b8b8c3f8')
source_aarch64=("syn-wine-helper-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-wine-helper-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('d10f34f6e40d12ad7285a565a7c7bdede1096e180c1e3dfcfe2980156a26a0a5')

package() {
    bsdtar -xpf "$srcdir/syn-wine-helper-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
