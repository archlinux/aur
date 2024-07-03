# Contributor: Sergey A. <murlakatamenka@disroot.org>
# Contributor: Asuka Minato
pkgname=aichat-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Using ChatGPT/GPT-3.5/GPT-4 in the terminal"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/sigoden/aichat"
license=('MIT' 'APACHE')
conflicts=('aichat' 'aichat-git')
# for license
source=("https://github.com/sigoden/aichat/archive/refs/tags/v${pkgver}.tar.gz")
source_aarch64=("https://github.com/sigoden/aichat/releases/download/v${pkgver}/aichat-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
source_x86_64=("https://github.com/sigoden/aichat/releases/download/v${pkgver}/aichat-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_i686=("https://github.com/sigoden/aichat/releases/download/v${pkgver}/aichat-v${pkgver}-i686-unknown-linux-musl.tar.gz")
sha256sums=('94bc8b23b9c223e3a4191ec5c530fb4c26d5437f3a1a8ed895aa1e2f4dab49a2')
sha256sums_i686=('d90d6d1ee6ac7c6328b4443552626fdcf01de82d4ad2a919370c6f14aa9bf692')
sha256sums_x86_64=('d8e0f67be795160792ec7f39a9bbff920c70f9082390ad384382627134539833')
sha256sums_aarch64=('7ab0a4da6d07400a0fef86c02a573c22f053b9f965a1d01e30d69b159f47a4f2')

package() {
	find . -type f -name "aichat" -print -exec install -vDm755 {} -t $pkgdir/usr/bin/ \;
	find . -type f -name "LICENSE*" -print -exec install -vDm644 {} -t $pkgdir/usr/share/licenses/$pkgname/ \;
}
