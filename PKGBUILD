# Maintainer: Askez <xmingwp@gmail.com>
pkgname=six-cli-bin
pkgver=V0.0.6.alpha
_pkgver=V0.0.6-alpha
pkgrel=1
pkgdesc="6盘(https://6pan.cn/)命令行工具."
arch=('x86_64')
depends=()
conflicts=('six-cli')
provides=('six-cli')
url="https://github.com/Mrs4s/six-cli/releases"
license=("MIT")
source=("https://raw.githubusercontent.com/Mrs4s/six-cli/master/LICENSE")
source_x86_64=("https://github.com/Mrs4s/six-cli/releases/download/${_pkgver}/six-cli_${_pkgver}_linux_amd64.tar.gz")

sha256sums=('da83bd24e0b998c9e08439af1c0ea997d6c395bfbf3a380aa0441cb9ae575f1f')
sha256sums_x86_64=('d2c4ea3d017cca4b8fc5b8afc443bf140c6a9e8ce24a9811a036d8d89aa7facf')
package() {
    dir="$srcdir"
    install -Dm755 $dir/six-cli ${pkgdir}/usr/bin/six-cli
    install -Dm755 LICENSE ${pkgdir}/usr/share/licenses/six-cli/LICENSE
    echo "How to use: https://github.com/Mrs4s/six-cli/blob/master/README.md"
}