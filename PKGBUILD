# Maintainer: levinit <levinit at outlook>

pkgname=mockingbot
_pkgname=MockingBot
pkgver=0.5.1
pkgrel=1
pkgdesc="a prototyping tool.墨刀/modao"
arch=('i686' 'x86_64')
url="https://modao.cc/downloads"
license=('custom')
depends=('gconf')

if [ "$CARCH" = "i686" ]; then
  arch="_i386"
fi
if [ "$CARCH" = "x86_64" ]; then
  arch="_amd64"
fi

source_common="https://s3.cn-north-1.amazonaws.com.cn/modao/downloads"
source_x86_64=("$source_common/$_pkgname$arch.deb")
source_i686=("$source_common/$_pkgname$arch.deb")

md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

prepare() {
    echo "extract fils from $_pkgname$arch.deb..."
    bsdtar -xJf $_pkgname$arch.deb
}

package() {
    install -Ddm755 usr

}

