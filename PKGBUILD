pkgname=nekokolpa2
pkgver=2.2.4
pkgrel=586
pkgdesc='Cross-platform eSIM management app for working with local eUICCs, external readers, and remote reader endpoints'
arch=(x86_64)
url='https://github.com/iebb/NekokoLPA2'
license=(MIT)
depends=()
options=(!debug)
makedepends=()
source=('https://github.com/iebb/NekokoLPA2/releases/download/v2.2.4%2B586/ee.nekoko.nlpa2.linux-2.2.4-586-x64.tar.gz')
sha256sums=('c3e0a4be7d95858cb86f7124992d5863a6e24fc72a67e96daa55391550ee7388')

package() {
    install -Dm755 "${startdir}/nlpa2.sh" "${pkgdir}/usr/bin/nlpa2"
    install -Dm644 "${startdir}/nlpa2.desktop" "${pkgdir}/usr/share/applications/nlpa2.desktop"
    install -Dm755 "${srcdir}/nlpa2" "${pkgdir}/usr/share/nlpa2/nlpa2"
    cp -rp "${srcdir}"/{data,lib} "${pkgdir}/usr/share/nlpa2/"
}
