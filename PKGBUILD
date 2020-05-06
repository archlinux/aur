# Maintainer: Sakitami <sakitam2373@gmail.com>

pkgname=utools-yuanke
pkgver=1.0.1
pkgrel=2
pkgdesc="你的生产力工具集"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=(
    'gtk3'
    'nss'
    'libxss'
)
source=(
    "https://resource.u-tools.cn/currentversion/utools_$pkgver-beta_amd64.deb"
)
sha512sums=(
    'efcb0d4f24a4c6cbaf808d30046ee8bfd11a385662b9c558a3cbed7ef6a1cf38e3dcbe372e6442d8abcc4c45e8252e0f207feb40919e55d76df9d446a7234c16'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
