
# Maintainer: Taiko2k <captain dot gxj at gmail dot com>

pkgname='tauon-music-box'
pkgdesc='A streamlined music player that uses BASS'
url="https://github.com/taiko2k/tauonmb"
arch=('x86_64')
license=('custom')

pkgver=2.6.2
pkgrel=1

depends=('python3' 'noto-fonts' 'noto-fonts-emoji' 'sdl2_image' 'python-pillow' 'python-pylast' 'python-xlib' 'python-gobject' 'xdg-utils' 'python-beautifulsoup4' 'python-requests' 'python-cairo' 'python-stagger' 'python-hsaudiotag3k')

optdepends=('python-flask: Web interface' 'ffmpeg: File transcoding')

source=('https://github.com/Taiko2k/tauonmb/releases/download/v2.6.2/Tauon.Music.Box.v2.6.2.Linux.Bass.64bit.zip')

sha1sums=('c48632f4e05cc7cd12780a47563b9224d686a6df')

package() {

  install -dm755 "$pkgdir/opt/"

  install -D -m755 "$srcdir/$pkgname/tauonmb.desktop" "$pkgdir/usr/share/applications/tauonmb.desktop"
  install -D -m755 "$srcdir/$pkgname/tauonmb-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tauonmb-symbolic.svg"
  install -D -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cp -R "$srcdir/$pkgname/" "$pkgdir/opt/$pkgname"
  }
