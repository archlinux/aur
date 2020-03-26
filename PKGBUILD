
# Maintainer: Taiko2k <captain dot gxj at gmail dot com>

pkgname='tauon-music-box'
pkgdesc='A modern streamlined music player'
url="https://github.com/taiko2k/tauonmb"
arch=('any')
license=('GPL3')

pkgver=5.4.1
pkgrel=1

depends=('python3' 'noto-fonts' 'noto-fonts-extra' 'sdl2_image' 'python-pillow' 'python-pylast' 'python-gobject' 'xdg-utils' 'python-beautifulsoup4' 'python-requests' 'python-cairo' 'python-stagger' 'python-hsaudiotag3k' 'python-flask' 'python-setproctitle' 'flac' 'python-musicbrainzngs' 'python-discogs-client' 'alsa-plugins' 'gstreamer' 'gst-plugins-base' 'python-dbus')

optdepends=('ffmpeg: File transcoding' 'noto-fonts-cjk: Matching font for CJK characters' 'p7zip: 7z archive extraction support' 'unrar: RAR archive extraction support' 'python-plexapi: PLEX client streaming' 'picard: Tag editing' 'gst-plugins-good: Extra GStreamer codecs' 'gst-plugins-bad: Extra GStreamer codecs' 'gst-plugins-ugly: Extra GStreamer codecs')

source=('https://github.com/Taiko2k/tauonmb/releases/download/v5.4.1/Tauon.Music.Box.v5.4.1.Linux.zip')

sha1sums=('cc0b3cc5d4dd09f76b3baecdaf8b249506aadcf7')

package() {

  install -dm755 "$pkgdir/opt/"

  install -D -m755 "$srcdir/$pkgname/extra/tauonmb.desktop" "$pkgdir/usr/share/applications/tauonmb.desktop"
  install -D -m755 "$srcdir/$pkgname/extra/tauonmb-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tauonmb-symbolic.svg"
  install -D -m755 "$srcdir/$pkgname/extra/tauonmb.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tauonmb.svg"

  cp -R "$srcdir/$pkgname/" "$pkgdir/opt/$pkgname"
  
  install -D -m755 "$srcdir/$pkgname/extra/tauonmb.sh" "$pkgdir/opt/$pkgname/tauonmb.sh"
  
  }


