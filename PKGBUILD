# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=anich-bin
pkgdesc="一个支持超分辨率的在线动漫弹幕APP。多平台，多番剧源，多弹幕，高清无广告。追番看番必备软件。"
pkgver=1.4.2
pkgrel=2
arch=('x86_64')
url="https://github.com/Sle2p/AniCh"
license=('unknown')
conflicts=('anich')
source=("https://github.com/Sle2p/AniCh/releases/download/${pkgver}/anich-linux-${pkgver}.deb")
sha256sums=('SKIP')

package() {
    tar -I zstd -xf data.tar.zst -C "${pkgdir}/"
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /usr/share/anich/anich "${pkgdir}/usr/bin/anich"
}
