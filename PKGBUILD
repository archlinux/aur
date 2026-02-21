# Maintainer: Doro <3504638270@qq.com>
#
# 免责声明 (Disclaimer)
# 此 PKGBUILD 仅用于将上游已构建好的 Arch 包重新打包并发布到 AUR。
# 软件本身由上游开发者维护，与本维护者无关。
# 若软件运行出现问题，请优先向上游反馈；
# 仅当 AUR 安装、构建流程本身出现问题时，可联系本维护者。
#
# This PKGBUILD is only for repackaging the pre-built Arch package from upstream and publishing it to AUR.
# The software itself is maintained by the upstream developers and is not related to this maintainer.
# If you encounter issues with the software itself, please report them to the upstream project first.
# Only contact this maintainer if there are problems with the AUR package installation or build process.
#
# 上游项目地址 / Upstream URL: https://github.com/SRInternet-Studio/Wallpaper-generator

pkgname="wallpaper-generator-next-bin"
pkgver="5.1.0"
pkgrel=1
arch=('x86_64')
url="https://github.com/SRInternet-Studio/Wallpaper-generator"
license=('MIT')
provides=('wallpaper-generator-next')
conflicts=('wallpaper-generator-next')
depends=('glibc' 'gcc-libs')
pkgdesc="个性化聚合图片生成平台"
source=("https://github.com/SRInternet-Studio/Wallpaper-generator/releases/download/v${pkgver}/wallpaper-generator-next-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('40410d3e344c17298089cfdbb8d77155df88ad2514cc66580dd1ad247944ccb0')

build() {
    :
}

package() {
    bsdtar -xf "${srcdir}/"*.pkg.tar.zst -C "${pkgdir}"
    rm -f "${pkgdir}/.BUILDINFO"
    rm -f "${pkgdir}/.MTREE"
    rm -f "${pkgdir}/.PKGINFO"
}

