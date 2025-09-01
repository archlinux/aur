# Maintainer: Richard Chapman Gomes <chapgx@codeh.io>

pkgname=attu-chap
pkgver=2.6.0
filename=attu_${pkgver}_amd64.deb
pkgrel=1
pkgdesc="Attu is an all-in-one milvus administration tool."
arch=("x86_64")
url="https://github.com/zilliztech/attu"
license=("Apache 2.0")
source=("${url}/releases/download/v${pkgver}/$filename")
sha256sums=("99320adbbfdf9a55fb319af9b93fdc224e2dbd57281342512e3058a628324ec9")
options=('!strip' '!debug')

package() {
  cd $srcdir

  ar x "$filename"

  tar -xvf data.tar.* -C "$pkgdir"
}
