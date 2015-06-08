# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=mooni
pkgver=0.5
pkgrel=2
pkgdesc='Simple interactive MoonScript.'
arch=('any')
url='https://rocks.moonscript.org/modules/steved/mooni'
license=('MIT' 'X11')
depends=('moonscript' 'lua-linenoise')
source=("http://stevedonovan.github.com/files/mooni-${pkgver}.tgz"
        "${pkgname}.patch")
sha256sums=('5ebde048351c5e6a99c7d496f66285be95c8d3f49aa8a024aa8ecef5be3b8b01'
            '1b50a2a362ccc50051a18538911218e48c4aa81ec2efad26682b42d1817d0b1a')

build() {
    patch ${pkgname} < ${pkgname}.patch
}

package() {
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

