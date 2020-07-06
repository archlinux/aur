
# Maintainer: Taiko2k <captain dot gxj at gmail dot com>

pkgname='tauon-music-box'
pkgdesc='A modern streamlined music player'
url="https://github.com/taiko2k/tauonmb"
arch=('any')
license=('GPL3')

pkgver=6.0.1
pkgrel=1

depends=('python3' 'noto-fonts' 'noto-fonts-extra' 'sdl2_image' 'python-pillow' 'python-pylast' 'python-gobject' 'xdg-utils' 'python-beautifulsoup4' 'python-requests' 'python-cairo' 'python-flask' 'python-setproctitle' 'flac' 'python-musicbrainzngs' 'alsa-plugins' 'gstreamer' 'gst-plugins-base' 'python-dbus' 'python-oauthlib' 'python-six' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'noto-fonts-cjk')

optdepends=('ffmpeg: File transcoding' 'p7zip: 7z archive extraction support' 'unrar: RAR archive extraction support' 'python-plexapi: PLEX streaming' 'python-tekore: Spotify playback control' 'picard: Tag editing')

source=('https://github.com/Taiko2k/tauonmb/releases/download/v6.0.1/Tauon.Music.Box.v6.0.1.Linux.zip')

sha1sums=('78c3e121483e3ceb8fe615b141ea8794de672093')

package() {

  install -dm755 "$pkgdir/opt/"

  install -D -m755 "$srcdir/$pkgname/extra/tauonmb.desktop" "$pkgdir/usr/share/applications/tauonmb.desktop"
  install -D -m755 "$srcdir/$pkgname/extra/tauonmb-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tauonmb-symbolic.svg"
  install -D -m755 "$srcdir/$pkgname/extra/tauonmb.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tauonmb.svg"

  cp -R "$srcdir/$pkgname/" "$pkgdir/opt/$pkgname"
  
  install -D -m755 "$srcdir/$pkgname/extra/tauonmb.sh" "$pkgdir/opt/$pkgname/tauonmb.sh"
  install -D -m755 "$srcdir/$pkgname/extra/tauonmb.sh" "$pkgdir/usr/bin/tauon"
  
  }


