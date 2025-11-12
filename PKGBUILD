# Maintainer: Hagarashi <hagarashi@proton.me>
pkgname='lrcfetch-bin'
pkgver='v0.0.0'
pkgrel=1
pkgdesc='Tool to fetch lyrics from LRCLIB'
arch=('x86_64')
url="https://github.com/hagaraShin/lrcfetch-tui"
license=('MIT')
depends=(glibc gcc-libs openssl)
provides=('lrcfetch')
conflicts=('lrcfetch-git')
source=("https://github.com/hagaraShin/lrcfetch-tui/releases/download/${pkgver}/lrcfetch" 'LICENSE')
noextract=()
sha256sums=('cb87c04859e8bea9ec748817eedb0bf2775143cceb71016080ba95e0dfaddc78'
            'f9c17e6e435c14f7a7ebad2ec796bf8cd0ece925ecd65e1b797f3b8ec603e6ce')

package() {
	install -Dm755 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 lrcfetch -t "$pkgdir/usr/bin/$pkgname/"
}
