# Maintainer : Aloxaf <aloxafx@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

pkgname=qiniu-qshell-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="CLI tool for Qiniu"
arch=('x86_64')
url="https://github.com/qiniu/qshell"
license=('MIT')
provides=('qshell')
source=("https://github.com/qiniu/qshell/releases/download/v${pkgver}/qshell-v${pkgver}-linux-amd64.tar.gz")
sha256sums=(37a4f91eb19eefabad6f37a0f8738e82d32a657dd81989a801ac37cb97543e8f)

package() {
    install -Dm755 "${srcdir}/qshell" "${pkgdir}/usr/bin/qshell"
}
