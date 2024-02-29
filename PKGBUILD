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
replaces=('uwu')
source=("https://github.com/qsqcqs/uwu/releases/download/${pkgname}-v${pkgver}/${pkgname}-v${pkgver}.pkg.tar.zst")
noextract=()
validpgpkeys=()



package() {
    
    sudo install -Dm755 uwu "/usr/bin/uwu"
}

sha256sums=('2dbae156540f5202402544642790f4f4b857dc560ac82dc0d9c935fc8055e284')
