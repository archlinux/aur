# Maintainer: Nick Lozon <nicklozon@gmail.com>
pkgname=spr-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="Stacked Pull Requests on GitHub"
arch=('x86_64')
url="https://github.com/ejoffe/spr"
license=('MIT')
depends=('git')
provides=('spr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ejoffe/spr/releases/download/v${pkgver}/spr_linux_x86_64.tar.gz")
sha256sums=('358bd1fabaa22974a3d1a4e15776ee39885d571effb2a47f9db7f92c0756e55f')

package() {
    cd "$srcdir"
    
    # Install binaries to /usr/bin
    install -Dm755 git-amend "$pkgdir/usr/bin/git-amend"
    install -Dm755 git-spr "$pkgdir/usr/bin/git-spr"
    install -Dm755 spr_reword_helper "$pkgdir/usr/bin/spr_reword_helper"
}
