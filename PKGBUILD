# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-quitsmoke-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='QuitSmoke: quit smoking or vaping tracker — milestones, health recovery, savings'
depends=('synshell-core')
provides=('syn-quitsmoke')
conflicts=('syn-quitsmoke' 'syn-quitsmoke-git')
options=('!strip' '!debug')
noextract=('syn-quitsmoke-0.2.0-x86_64.tar.zst' 'syn-quitsmoke-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-quitsmoke-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-quitsmoke-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('aa447a4fb87ec22d4841e9221fd3eedfb130eeeb0c3ba9cb4a2fd52597f6c9e8')
source_aarch64=("syn-quitsmoke-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-quitsmoke-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('bda6dedbd8a023314c34a2f228348cdbde66c62dfe747e017da87c5e7de712d0')

package() {
    bsdtar -xpf "$srcdir/syn-quitsmoke-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
