# Maintainer: imoutocon
pkgname='uwu-qwq'
pkgver=1.0
pkgrel=1
pkgdesc="uwu for terminal"
arch=('x86_64')
url="https://github.com/qsqcqs/uwu"
license=('GPL-3.0-or-later')
depends=('python3')
checkdepends=()
optdepends=()
replaces('uwu')
source=("https://github.com/qsqcqs/uwu/releases/download/${pkgname}-v${pkgver}/${pkgname}-v${pkgver}.pkg.tar.zst")
noextract=()
validpgpkeys=()



package() {
    
    sudo install -Dm755 uwu "/usr/bin/uwu"
}

sha256sums=('473f26e5355f0b6987978c4aec1310227359afc1e569f31d2cd0b9ddc093a04b')
