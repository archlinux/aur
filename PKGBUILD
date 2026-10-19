# Maintainer: Simon Curtis <simon@jitzu.dev>
pkgname=jz-bin
pkgver=0.1.54
_releasever=0.1.54
pkgrel=1
pkgdesc="The Jitzu programming language interpreter and shell"
arch=('x86_64')
url="https://github.com/jitzulang/jitzu"
license=('MIT')
provides=('jz')
conflicts=('jz')
depends=('glibc')
options=('!strip')
source=("https://github.com/jitzulang/jitzu/releases/download/v${_releasever}/jitzu-${_releasever}-linux-x64.zip"
        "LICENSE::https://raw.githubusercontent.com/jitzulang/jitzu/v${_releasever}/LICENSE")
sha256sums=('f8e08f1eb300e9789b57be179b6fb07d62acfcf3cedbe809dad0b439a9c308ee'
            'eb417ae2fb3f0ee56c65eb338b940c2fdaf96aabbcd16ff9cb123db84287ca87')

package() {
    install -Dm755 jz "${pkgdir}/usr/bin/jz"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
