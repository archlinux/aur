# Maintainer: PhantomShift <phantomsmhift at proton dot me>

_pkgname=lxcomm
pkgname=$_pkgname-bin
pkgver=0.4.0
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
sha256sums=('756892d13a8ee98487c25b9b8c06780a40091b1062017d2cbf4da68ab3da1474'
            '53329bb76818eea16336345770e10cb8c088894d09885d2cd38c1837f9e63d70'
            '9448cfe1cee692c09177164b16ed32e54517be633130a79d8fae34b1fcd6d5c9')
sha256sums_x86_64=('2b61d746e29a65948143bf1ec8b94691481c87bd33dce8822901f4386b751b19')
sha256sums_aarch64=('94201de86cd60d317ad61a764f5fd33b33a17b379177385515c14ea01a1664a2')

package() {
  install -Dm755 -t "$pkgdir/usr/bin/" $_pkgname
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE-MIT
  install -Dm644 -t "$pkgdir/usr/share/applications/" $_pkgname.desktop
  install -Dm644 -t "$pkgdir/usr/share/pixmaps/" $_pkgname.svg
}
