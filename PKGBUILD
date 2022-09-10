# Maintainer: livev2 <co@livev2.com>
# Contributor: arliweng <arliweng@outlook.com>

pkgname=v2mixer-bin
pkgver=1.20210707
pkgrel=1
pkgdesc='v2mixer, the movie editor, video mixer'
arch=('x86_64')
license=('custom')
url="http://v2mixer.livev2.com/"
depends=('jre8-openjdk' 'ffmpeg4.4')
source=("https://v2mixer.livev2.com/f/cms/10/v2mixer-linux-x86_64-native-$pkgver.tgz"
	v2mixer.desktop)
sha256sums=('129c7d10a35df09db4450c701b698286328b8011699970a43090b1faa0079893'
            '0b4469724aa3dc23a90fab47cea181292df97573f72a6238a360ba646f9a090c')

package() {
	mkdir -p ${pkgdir}/usr/share/livev2.com
	cp -rL v2mixer ${pkgdir}/usr/share/livev2.com
	install -D -m644 v2mixer.desktop ${pkgdir}/usr/share/applications/v2mixer.desktop
}
