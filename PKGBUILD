# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synshell-mobile-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell for phones: mobile shell, modem (calls, SMS, data), NFC, compass, step counter'
depends=('synshell-core')
provides=('synshell-mobile')
conflicts=('synshell-mobile' 'synshell-mobile-git')
options=('!strip' '!debug')
noextract=('synshell-mobile-0.2.0-x86_64.tar.zst' 'synshell-mobile-0.2.0-aarch64.tar.zst')
source_x86_64=("synshell-mobile-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synshell-mobile-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('b0ac77e68ce8221e71dcd8de0cd81866e8399fb772e8fd1e7e583bffd15bcbb0')
source_aarch64=("synshell-mobile-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synshell-mobile-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('846cba916d7e7ab43193b7111a20845edcb879f0a7be19a219eefec2fe66505b')

package() {
    bsdtar -xpf "$srcdir/synshell-mobile-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
