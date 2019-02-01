# Maintainer: Denis Sheremet <zaycakitayca@xaker.ru>

pkgname=yandex-browser-ffmpeg-codecs-opera
pkgver=0.0.2
pkgrel=1
pkgdesc="symlink for opera-ffmpeg-codecs package to be used with yandex-browser"
arch=('any')
url="https://www.archlinux.org/packages/community/x86_64/opera-ffmpeg-codecs/"
license=('GPL')
depends=('opera-beta-ffmpeg-codecs')
conflicts=('yandex-browser-ffmpeg-codecs')
provides=('yandex-browser-ffmpeg-codecs')

package() {
	mkdir -p "$pkgdir/opt/yandex/browser-beta"
	ln -s "/usr/lib/opera-beta/lib_extra/libffmpeg.so" "$pkgdir/opt/yandex/browser-beta"
}
