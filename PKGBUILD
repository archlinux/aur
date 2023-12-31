# Contributor: Sergey A. <murlakatamenka@disroot.org>
# Contributor: Asuka Minato
pkgname=aichat-bin
pkgver=0.12.0
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
sha256sums=('4713e650f0898b927c1d61f61c9b2871612956c416c8b45a3e213b69f7455996')
sha256sums_i686=('35c068bd1a324a45aaa4619bc47c9b72b4ad335b52339002324b039c6e2a33c7')
sha256sums_x86_64=('6e0536d377be24dca9e9aaf7e0d70269e1e3cf2af48cc6f8d076c91e4043c28b')
sha256sums_aarch64=('9365ddb709c464b3aa89f82dfbbf6b715b5065b3bb113bd8630947694d945907')

package() {
	find . -type f -name "aichat" -print -exec install -vDm755 {} -t $pkgdir/usr/bin/ \;
	find . -type f -name "LICENSE*" -print -exec install -vDm644 {} -t $pkgdir/usr/share/licenses/$pkgname/ \;
}
