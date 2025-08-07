# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=nerdlog-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Nerdlog: fast, remote-first, multi-host TUI log viewer with timeline histogram and no central server"
arch=("x86_64")
url="https://github.com/dimonomid/nerdlog"
license=("BSD-2-Clause")
depends=(
    'glibc'
)
optdepends=(
    'libx11: clipboard support'
)
source=("https://github.com/dimonomid/nerdlog/releases/download/v${pkgver}/nerdlog_${pkgver}_linux_amd64.tar.gz")
b2sums=('80f3a06719d231f1773b16d210f052f87eca3ac2560748a2f8ec00b208756e556b2c9be0963bbabd6fffc5071948499f07d47076e6232d7eb3413b955fb62297')

package() {
    install -Dm755 "nerdlog" "${pkgdir}/usr/bin/nerdlog"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
