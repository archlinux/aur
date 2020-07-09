# Maintainer: Kevin Sanchez <kucashu@outlook.com>
# Maintainer: zhullyb <5435486@qq.com>

pkgname=fgit-go
pkgver=0.5
pkgrel=1
pkgdesc="A tool to do git operation with fastgit easily"
arch=('i686' 'x86_64' 'arm' 'arm64')
url="https://github.com/fastgitorg/fgit-go"
license=('GPL3')
depends=('git')
provides=('fgit')
conflicts=('fgit')

source_i686=(
    "fgit::https://github.com/fastgitorg/fgit-go/releases/download/${pkgver}/fgit-linux-386"
)
source_x86_64=(
    "fgit::https://github.com/fastgitorg/fgit-go/releases/download/${pkgver}/fgit-linux-amd64"
)
source_aarch64=(
    "fgit::https://github.com/fastgitorg/fgit-go/releases/download/${pkgver}/fgit-linux-arm64"
)
source_armv6h=(
    "fgit::https://github.com/fastgitorg/fgit-go/releases/download/${pkgver}/fgit-linux-arm"
)
source_armv7h=(
    "fgit::https://github.com/fastgitorg/fgit-go/releases/download/${pkgver}/fgit-linux-arm"
)

md5sums_i686=(
    '620c2f28bc1c810375f519e6a26a3fe4'
)
md5sums_x86_64=(
    '62951732ddfb354907208e25500eb39b'
)
md5sums_aarch64=(
    '84e1360e1f68da7f9a2a98736d7c8aaa'
)
md5sums_armv6h=(
    'eceaa6c0ea87588fe020c14e2d3f8308'
)
md5sums_armv7h=(
    'eceaa6c0ea87588fe020c14e2d3f8308'
)

package() {
    cd "$srcdir"
    
    install -Dm755 "fgit" "$pkgdir/usr/bin/fgit"
}
