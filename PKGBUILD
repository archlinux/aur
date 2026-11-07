# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-themeeditor-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell theme editor with live preview'
depends=('synshell-core')
provides=('syn-themeeditor')
conflicts=('syn-themeeditor' 'syn-themeeditor-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-themeeditor-0.2.0-x86_64.tar.zst' 'syn-themeeditor-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-themeeditor-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-themeeditor-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('57bcea2afacacd6a663b56e42929f2e336b283e3871691b0209f6e9290a2ae01')
source_aarch64=("syn-themeeditor-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-themeeditor-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('7a4a103dbeb92ddcd829b2e2f76a58616c8a5d592ab1045883002ff7472c9a32')

package() {
    bsdtar -xpf "$srcdir/syn-themeeditor-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
