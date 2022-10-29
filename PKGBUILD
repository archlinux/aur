# Maintainer : Aloxaf <aloxafx@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

pkgname=qiniu-qshell-bin
pkgver=2.9.0
pkgrel=1
pkgdesc="CLI tool for Qiniu"
arch=('x86_64')
url="https://github.com/qiniu/qshell"
license=('MIT')
provides=('qshell')
source=("https://github.com/qiniu/qshell/releases/download/v${pkgver}/qshell-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('d09e8223e449dec179076f48610e04e8885df59f785085bb23c47223ea3bbf40')

package() {
    install -Dm755 "${srcdir}/qshell" "${pkgdir}/usr/bin/qshell"
}
