# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=chatgpt-cli-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="ChatGPT Console client in Golang"
arch=("x86_64" "aarch64" "i386")
url="https://github.com/kkdai/chatgpt"
license=('MIT')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('chatgpt')
conflicts=()
source_x86_64=("https://github.com/kkdai/chatgpt/releases/download/v${pkgver}/chatgpt_0.2.1_linux_amd64.tar.gz")
source_aarch64=("https://github.com/kkdai/chatgpt/releases/download/v${pkgver}/chatgpt_0.2.1_linux_arm64.tar.gz")
source_i386=("https://github.com/kkdai/chatgpt/releases/download/v${pkgver}/chatgpt_0.2.1_linux_386.tar.gz")
sha256sums_x86_64=('a83bc2c36e10938360a22b3a16168b163a17ae5948b90d3929a95ce0f2079aa6')
sha256sums_aarch64=('dbcb498542278adb5ec007b84a035bca5c8966790b800cddbd49599ac20e352f')
sha256sums_i386=('e65ca535d2159964709a9dd831d5156339235f9b66ea72e56f7a0f8ea744ad35')

package() {
        cd $srcdir
        install -Dm755 chatgpt -t $pkgdir/usr/bin/
        install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
        printf "usage: export API_KEY=YOUR_KEY, then use chatgpt\n"
}

