
# Maintainer: Taiko2k <captain dot gxj at gmail dot com>

pkgname='tauon-music-box'
pkgdesc='A streamlined music player that uses BASS'
url="https://github.com/taiko2k/tauonmb"
arch=('x86_64')
license=('custom')

pkgver=5.0.0
pkgrel=1

depends=('python3' 'noto-fonts' 'noto-fonts-emoji' 'noto-fonts-extra' 'sdl2_image' 'python-pillow' 'python-pylast' 'python-gobject' 'xdg-utils' 'python-beautifulsoup4' 'python-requests' 'python-cairo' 'python-stagger' 'python-hsaudiotag3k' 'python-flask' 'python-setproctitle' 'flac' 'python-musicbrainzngs' 'python-discogs-client' 'alsa-plugins')

optdepends=('ffmpeg: File transcoding' 'noto-fonts-cjk: Matching font for CJK characters' 'p7zip: 7z archive extraction support' 'unrar: RAR archive extraction support' 'python-plexapi: PLEX client streaming' 'picard: Tag editing')

source=('https://github.com/Taiko2k/tauonmb/releases/download/v5.0.0/Tauon.Music.Box.v5.0.0.Linux.Bass.64bit.zip')

sha1sums=('bcbd6023e161071dae610576e8a8e4ef68c11556')

package() {

  install -dm755 "$pkgdir/opt/"

  install -D -m755 "$srcdir/$pkgname/extra/tauonmb.desktop" "$pkgdir/usr/share/applications/tauonmb.desktop"
  install -D -m755 "$srcdir/$pkgname/extra/tauonmb-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tauonmb-symbolic.svg"
  install -D -m755 "$srcdir/$pkgname/extra/tauonmb.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/tauonmb.svg"
  install -D -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cp -R "$srcdir/$pkgname/" "$pkgdir/opt/$pkgname"
  }


