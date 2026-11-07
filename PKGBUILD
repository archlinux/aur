# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-systeminfo-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell system monitor: processes, CPU, GPU, memory, disks, network'
depends=('synshell-core')
provides=('syn-systeminfo')
conflicts=('syn-systeminfo' 'syn-systeminfo-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-systeminfo-0.2.0-x86_64.tar.zst' 'syn-systeminfo-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-systeminfo-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-systeminfo-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('0e3d42f7aba33d167f9b177741945ff91fecfd7c20d81b5ee986d6c4d4a9e53d')
source_aarch64=("syn-systeminfo-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-systeminfo-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('a7cffc3b1b07e477cca891e3c43fe3fcb987d42e009b7285efbf98927fc79b2f')

package() {
    bsdtar -xpf "$srcdir/syn-systeminfo-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
