# Contributor: Sergey A. <murlakatamenka@disroot.org>
# Contributor: Asuka Minato
pkgname=aichat-bin
pkgver=0.19.0
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
sha256sums=('ad18bcca2264c467c98e3f3fda86c02b140e201e0d253895a23a3ee5e7e1a9ee')
sha256sums_i686=('6ea55e2b883993e75f59390b4a1595e680080179367dc9a84ad4f4f072364efe')
sha256sums_x86_64=('ba1b8b93003d3c9aa1932188e4f03e1ce5bb851f2e7d0bcfd635512f20f9616d')
sha256sums_aarch64=('0da018db10120d6bf3ab9fcf85b0b15d8386d627ff2d6dc4836668d369dab292')

package() {
	find . -type f -name "aichat" -print -exec install -vDm755 {} -t $pkgdir/usr/bin/ \;
	find . -type f -name "LICENSE*" -print -exec install -vDm644 {} -t $pkgdir/usr/share/licenses/$pkgname/ \;
}
