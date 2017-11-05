# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix

pkgname=chromium-ffmpeg-codecs-bin
pkgver=62.0.3202.62
pkgrel=1
pkgdesc="Prebuilt ffmpeg-codecs package extracted from Opera/Opera-beta from Herecura repository"
arch=('x86_64')
url="https://ffmpeg.org/"
license=('LGPL')
#depends=('chromium')
provides=('chromium-ffmpeg-codecs')
conflicts=('chromium-ffmpeg-codecs' 'vivaldi-codecs-ffmpeg-extra-bin')
source=("https://repo.herecura.eu/herecura/x86_64/opera-beta-ffmpeg-codecs-${pkgver}-1-x86_64.pkg.tar.xz")
md5sums=('fa9fe233f701e7c34413de8ef7abc892')

package() {
  install -D ${srcdir}/usr/lib/opera-beta/lib_extra/libffmpeg.so ${pkgdir}/usr/lib/chromium/libffmpeg.so
}

