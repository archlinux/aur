# Maintainer: Wojciech Szaranski <wojciech.szaranski@gmail.com>
pkgname=ejoffe-spr-bin
pkgver=0.15.1
pkgrel=2
pkgdesc="Tool to easily manage stacks of pull requests on GitHub"
arch=('x86_64' 'aarch64')
url="https://github.com/ejoffe/spr"
license=('MIT')

source_x86_64=("ejoffe-spr-bin-$pkgver-$pkgrel-x86_64.tar.gz::https://github.com/ejoffe/spr/releases/download/v${pkgver}/spr_linux_x86_64.tar.gz")
source_aarch64=("ejoffe-spr-bin-$pkgver-$pkgrel-aarch64.tar.gz::https://github.com/ejoffe/spr/releases/download/v$pkgver/spr_linux_arm64.tar.gz")

sha256sums_x86_64=('358bd1fabaa22974a3d1a4e15776ee39885d571effb2a47f9db7f92c0756e55f')
sha256sums_aarch64=('fadbdbbbf392dc55c260a34e01d1a6e7f4e2652556309ea625d35631af9ff481')

package() {
    mkdir -p "$pkgdir"/usr/bin
    install -m755 "$srcdir"/git-spr  "$pkgdir"/usr/bin/git-spr
    install -m755 "$srcdir"/git-amend  "$pkgdir"/usr/bin/git-amend
    install -m755 "$srcdir"/spr_reword_helper "$pkgdir"/usr/bin/spr_reword_helper
}
