# Maintainer: Simon Curtis <simon@jitzu.dev>
pkgname=jz-bin
pkgver=0.1.50
_releasever=0.1.50
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
sha256sums=('703ef8f1326027dcd46307b41e608c6df22403bbc00c1e2e88751bcee554ac7a'
            'eb417ae2fb3f0ee56c65eb338b940c2fdaf96aabbcd16ff9cb123db84287ca87')

package() {
    install -Dm755 jz "${pkgdir}/usr/bin/jz"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
