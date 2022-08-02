# Maintainer: Ralph Zhou <ralph-zhou@qq.com>
pkgname=ikatago-client
pkgver=1.6.0
pkgrel=1
pkgdesc="A tool for connect remote katago to local GUI"
arch=(x86_64)
url="https://github.com/kinfkong/ikatago-client"
_zipname=ikatago-$pkgver-linux
license=('GPL')
depends=('bash' 'unzip')
makedepends=('git')
source=("https://github.com/kinfkong/ikatago-client/releases/download/v$pkgver/ikatago-$pkgver-linux.zip")
sha256sums=('SKIP')

prepare() {
    unzip -o "$_zipname.zip"
}
package() {
    install -Dm755 "$_zipname"/ikatago "$pkgdir"/usr/bin/"$pkgname"
}
