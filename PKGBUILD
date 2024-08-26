# Maintainer: hksanduo <hksanduo [AT] gmail.com>

pkgname=attu
pkgver=2.4.7
filename=${pkgname}_${pkgver}_amd64.deb
pkgrel=1
pkgdesc="Attu is an all-in-one milvus administration tool."
arch=("x86_64")
url="https://github.com/zilliztech/attu"
license=("Apache 2.0")
source=("${url}/releases/download/v${pkgver}/$filename")
sha256sums=("4535b6c025dbdeea2e55c19145943d2d318e2daea8f2dee151b46a884e5747dd")
options=('!strip' '!debug')

package(){
    cd $srcdir
    tar -xJvf data.tar.xz -C "$pkgdir"
    
}

