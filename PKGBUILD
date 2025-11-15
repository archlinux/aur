# Maintainer: Hagarashi <hagarashi@proton.me>
pkgname='lrcfetch-bin'
pkgver='v0.0.1'
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
sha256sums=('3cf06f72717bb6aa51e065c9b72a10e7741bd57410c4f38759658fba0b6d0bb7'
            'f9c17e6e435c14f7a7ebad2ec796bf8cd0ece925ecd65e1b797f3b8ec603e6ce')

package() {
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 lrcfetch -t "$pkgdir/usr/bin/"
}
