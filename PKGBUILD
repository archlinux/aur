# Maintainer: Richard Chapman Gomes <chapgx@codeh.io>

pkgname=attu-chap
pkgver=2.6.5
filename=attu_${pkgver}_amd64.deb
pkgrel=1
pkgdesc="Attu is an all-in-one milvus administration tool."
arch=("x86_64")
url="https://github.com/zilliztech/attu"
license=("Apache 2.0")
source=("${url}/releases/download/v${pkgver}/$filename")
sha256sums=("0078fcedb22d1e073f476166f1fefb49a6c41833b678256fe22daf6cc3cbf983")
options=('!strip' '!debug')

package() {
  cd $srcdir

  ar x "$filename"

  tar -xvf data.tar.* -C "$pkgdir"
}
