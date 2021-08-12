# Maintainer: taotieren <admin@taotieren.com>

pkgname=i4tools-bin
pkgver=1.0.038
pkgrel=1
epoch=
pkgdesc="爱思助手是一款集“高效管理 iOS 设备数据”，“智能刷机”和“免费下载海量应用游戏、铃声壁纸”等为一体的 iOS 设备管理工具。"
arch=('any')
url="https://www.i4.cn/pro_pc.html"
license=('Custom')
groups=()
depends=('bash' 'ffmpeg' 'libwebp' 'sdl2')
makedepends=('libarchive')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("https://d-updater.i4.cn/i4linux/deb/${pkgname%-bin}_v${pkgver}.deb")
noextract=()
sha256sums=('c5d4c8850473095fd3677ad6077d9ebe5a290ce9b1c40f6e7671e852cfcad9ff')
#validpgpkeys=()



package() {
    bsdtar xf "${srcdir}/data.tar.xz" --no-same-owner -C "${pkgdir}"

    install -dm0755 "${pkgdir}/usr/bin"
    ln -sf "/usr/share/i4tools/i4toolslinux.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
