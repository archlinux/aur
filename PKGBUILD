# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=linuxqq
pkgver=2.0.0
pkgrel=3
pkgdesc='Tencent QQ for Linux'
arch=('x86_64' 'aarch64')
url='https://im.qq.com/linuxqq/download.html'
license=('custom')
depends=('gtk2' 'glibc' 'gcc-libs' 'nss')
source_x86_64=('https://qd.myapp.com/myapp/qqteam/linuxQQ/linuxqq_'${pkgver}'-b1-1024_amd64.deb')
md5sums_x86_64=('25dc612ff3dae3a1a86db4d79ad49058')
source_aarch64=('https://qd.myapp.com/myapp/qqteam/linuxQQ/linuxqq_'${pkgver}'-b1-1024_arm64.deb')
md5sums_aarch64=('a478d0c796e4bb1d4f81d2f5d2b809b7')

package() {
    tar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
