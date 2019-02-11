# Maintainer: dryland <dryland718@163.com>

pkgname=reliao
pkgver=2.9.0
pkgrel=1
pkgdesc="爱奇艺之家热聊"
arch=("x86_64")
url="https://home.iqiyi.com/app/download/index.html"
license=("custom")
depends=(
    "gtk2" "libxss"
)

source=("https://hotchat-dl.iqiyi.com/version/linux/${pkgname}_${pkgver}_amd64.deb")
md5sums=('950149e25ddb6d5240a6a2dad7fbfa91')

package() {
    cd ${srcdir}
    tar -xzvf data.tar.gz -C ${pkgdir}
}

