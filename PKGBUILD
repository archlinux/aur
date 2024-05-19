# Contributor: Sergey A. <murlakatamenka@disroot.org>
# Contributor: Asuka Minato
pkgname=aichat-bin
pkgver=0.17.0
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
sha256sums=('113f910315c6fd1bd0746daf346570a26883206d6f61a8a8dd07d98b4c509393')
sha256sums_i686=('b7bee96b865fcfabc28fab70bf74ecff0b7634d34879361125cc658dfe465d58')
sha256sums_x86_64=('158a2f432aa5105e982533fa5d96064e6bc27d8f1abb6c6e24228c315607631e')
sha256sums_aarch64=('35c1210a6952532ecfb90fd893b3453bc856370adb5a98ed2e555895cb4ecf85')

package() {
	find . -type f -name "aichat" -print -exec install -vDm755 {} -t $pkgdir/usr/bin/ \;
	find . -type f -name "LICENSE*" -print -exec install -vDm644 {} -t $pkgdir/usr/share/licenses/$pkgname/ \;
}
