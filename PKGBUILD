pkgname=ffmpeg-compat-pc
pkgver=1
pkgrel=1
pkgdesc="Make ffmpeg-compat work with pkg-config "
arch=('any')
url="http://ffmpeg.org"
license=('GPL')
depends=('ffmpeg-compat')

build() {
  mkdir -p ${pkgdir}/usr/lib/pkgconfig
  cd ${pkgdir}/usr/lib/pkgconfig
  cp /usr/lib/ffmpeg-compat/pkgconfig/* .
  rename '.pc' '_legacy.pc' *
}
