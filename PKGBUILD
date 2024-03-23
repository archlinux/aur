# Contributor: Sergey A. <murlakatamenka@disroot.org>
# Contributor: Asuka Minato
pkgname=aichat-bin
pkgver=0.14.0
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
sha256sums=('de554ef95d75a17b20f384b5f2ea07b3d2cd6112e87e9e038145d13285633468')
sha256sums_i686=('ab978a4d8c78dbfa663e12e0e6c7501f612c04878ebdbe3f3eca7dc8c9e76a4b')
sha256sums_x86_64=('3fa36aeb2c6456524a2dc164d94d4bdc8b2964ff26178f0db7f500f8933c3a53')
sha256sums_aarch64=('cd26301798021e3dcfe64f087fc0f4262b999d6cc94934418725b54dac28a00d')

package() {
	find . -type f -name "aichat" -print -exec install -vDm755 {} -t $pkgdir/usr/bin/ \;
	find . -type f -name "LICENSE*" -print -exec install -vDm644 {} -t $pkgdir/usr/share/licenses/$pkgname/ \;
}
