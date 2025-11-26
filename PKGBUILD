# Maintainer: cap153 <1536989047@qq.com>

pkgname=easytshark-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="专业的网络流量分析工具，简化网络数据包分析，让网络调试变得轻松高效"
arch=("x86_64")
url="https://www.xuanyuancode.com/easytshark"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3' 'wireshark-cli') 
source=("https://github.com/xuanyuanzhifeng/easytshark-release/releases/download/v1.0.2/easytshark_1.0.2_20251115135045_x86_64.deb")
sha256sums=('SKIP')
options=('!strip')
install='easytshark-bin.install'

package() {
  cd "$srcdir" || exit 1
	bsdtar -xf ${source[0]##*/}
	bsdtar -xf data.tar.gz -C "$pkgdir/"
}
# makepkg --printsrcinfo > .SRCINFO
