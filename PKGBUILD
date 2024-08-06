# Maintainer: hksanduo <hksanduo [AT] gmail.com>

pkgname=attu
pkgver=2.4.6
filename=${pkgname}_${pkgver}_amd64.deb
pkgrel=1
pkgdesc="Attu is an all-in-one milvus administration tool."
arch=("x86_64")
url="https://github.com/zilliztech/attu"
license=("Apache 2.0")
source=("${url}/releases/download/v${pkgver}/$filename")
sha256sums=("01593274a046a2755c87328cfc27d4835e6b9fa94db9d0deff2461c8a8bb767f")
options=('!strip' '!debug')

package(){
    cd $srcdir
    tar -xJvf data.tar.xz -C "$pkgdir"
    
}

