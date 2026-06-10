# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Tmux Plugin Manager"
arch=('x86_64' 'aarch64')
url="https://github.com/tmuxpack/tpack"
license=('MIT')
depends=('tmux')
provides=('tpack')
conflicts=('tpack')
source_x86_64=("https://github.com/tmuxpack/tpack/releases/download/v${pkgver}/tpack_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/tmuxpack/tpack/releases/download/v${pkgver}/tpack_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('76416e23369134e9fa5d20d5839f217fc29319e1937e728114b891d8bcde1754')
sha256sums_aarch64=('9b7c71161a634fb2a740c7916374b20ee45edaf92ac00197347806f15c79a023')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
