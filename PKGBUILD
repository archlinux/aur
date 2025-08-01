# Maintainer: PhantomShift <phantomsmhift at proton dot me>

_pkgname=lxcomm
pkgname=$_pkgname-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Mod browser, downloader and manager made for XCOM2(WOTC) on Linux"
url="https://github.com/PhantomShift/lxcomm"
license=('MIT OR Apache-2.0')
arch=('x86_64' 'aarch64')
provides=('lxcomm')
conflicts=('lxcomm')
depends=('steamcmd')
source=("https://raw.githubusercontent.com/PhantomShift/lxcomm/refs/tags/v${pkgver}/dist/lxcomm.desktop"
        "https://raw.githubusercontent.com/PhantomShift/lxcomm/refs/tags/v${pkgver}/LICENSE-MIT"
        "https://raw.githubusercontent.com/PhantomShift/lxcomm/refs/tags/v${pkgver}/assets/lxcomm.svg")
source_x86_64=("${url}/releases/download/v${pkgver}/lxcomm-v${pkgver}-Linux-GNU-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/lxcomm-v${pkgver}-Linux-GNU-aarch64.tar.gz")
sha256sums=('2e66f289e696385bd4ca70f78e34b05c8455fce2200f2c8c7d0297dbfa2f6417'
            '53329bb76818eea16336345770e10cb8c088894d09885d2cd38c1837f9e63d70'
            '9448cfe1cee692c09177164b16ed32e54517be633130a79d8fae34b1fcd6d5c9')
sha256sums_x86_64=('5c44bdbe010a91283acc04759cd6777c9118743f45091a2093b480527d34d988')
sha256sums_aarch64=('c38a448bd7b3bf676ad75147dc9bae0c011d3126cb3eef2690ee9c018cbd9291')

package() {
  install -Dm755 -t "$pkgdir/usr/bin/" $_pkgname
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE-MIT
  install -Dm644 -t "$pkgdir/usr/share/applications/" $_pkgname.desktop
  install -Dm644 -t "$pkgdir/usr/share/pixmaps/" $_pkgname.svg
}
