# Maintainer: tmuxpack <tmuxpack@users.noreply.github.com>
pkgname=tpack-bin
pkgver=0.5.1
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
sha256sums_x86_64=('48ba1cf1e5da47bc75a4cf336ecd9238095bd7ddedc8d7a03f5e71bfe99856cb')
sha256sums_aarch64=('26cbee0cdf5965b57955081e19fe2f3316ca998fbefd5f8967c526fbc132b7e5')

package() {
    install -Dm755 tpack "${pkgdir}/usr/bin/tpack"
}
