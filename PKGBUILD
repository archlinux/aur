# Maintainer : Aloxaf <aloxafx@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

pkgname=qiniu-qshell-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="CLI tool for Qiniu"
arch=('x86_64')
url="https://github.com/qiniu/qshell"
license=('MIT')
provides=('qshell')
source=("https://github.com/qiniu/qshell/releases/download/v${pkgver}/qshell-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('ae9b14dae50ab7944f7ed624f979ce032643239d1ee31b35477502ea09b57fa9')

package() {
    install -Dm755 "${srcdir}/qshell" "${pkgdir}/usr/bin/qshell"
}
