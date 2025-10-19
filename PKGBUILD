# Maintainer: Richard Chapman Gomes <chapgx@codeh.io>

pkgname=attu-chap
pkgver=2.6.1
filename=attu_${pkgver}_amd64.deb
pkgrel=1
pkgdesc="Attu is an all-in-one milvus administration tool."
arch=("x86_64")
url="https://github.com/zilliztech/attu"
license=("Apache 2.0")
source=("${url}/releases/download/v${pkgver}/$filename")
sha256sums=("9da74da052439e5d356c29c9359e5da6b733ba0a2ec776fddabd75a87743cd0d")
options=('!strip' '!debug')

package() {
  cd $srcdir

  ar x "$filename"

  tar -xvf data.tar.* -C "$pkgdir"
}
