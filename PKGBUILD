# Maintainer : Aloxaf <aloxafx@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

pkgname=qiniu-qshell-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="CLI tool for Qiniu"
arch=('x86_64')
url="https://github.com/qiniu/qshell"
license=('MIT')
provides=('qshell')
source=("http://devtools.qiniu.com/qshell-linux-x64-v${pkgver}.zip")
sha256sums=(c18944ae5a7217a6d0d9b96be2dcf5fda628670be694f1273f5e7b7c2bd2f3e9)

package() {
    install -Dm755 "${srcdir}/qshell-linux-x64-v$pkgver" "${pkgdir}/usr/bin/qshell"
}
