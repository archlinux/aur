# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synshell-link-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell: computer and phone link — screen, input, files, notifications (synlink)'
depends=('synshell-core')
optdepends=('openssh: ssh to linked devices'
            'fuse3: archives as folders; files of linked devices')
provides=('synshell-link')
conflicts=('synshell-link' 'synshell-link-git')
install=synshell-link.install
options=('!strip' '!debug')
noextract=('synshell-link-0.2.0-x86_64.tar.zst' 'synshell-link-0.2.0-aarch64.tar.zst')
source_x86_64=("synshell-link-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synshell-link-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('2caaecd979d5d7b471ccf12507c9921b36cc4b141fa9be69151c063a4f3fa003')
source_aarch64=("synshell-link-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synshell-link-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('163fd90ae52157725deeb224a10f51f7dce563504b4c6e83dfd2aec2e3a9bb7b')

package() {
    bsdtar -xpf "$srcdir/synshell-link-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
