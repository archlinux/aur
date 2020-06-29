# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=python-opensubtitlesdownload
_pkgname=OpenSubtitlesDownload
pkgver=4.1
pkgrel=1
arch=('any')
pkgdesc="Helps you quickly find and download subtitles for your favorite videos from OpenSubtitles.org"
url="https://emeric.io/OpenSubtitlesDownload"
license=('GPL3')
provides=('OpenSubtitlesDownload')
depends=('python' 'wget' 'gzip')
optdepends=(
    'zenity: only needed for GNOME based desktop environments'
    'kdialog: only needed for KDE based desktop environments'
)
source=("https://github.com/emericg/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('ada08ad3bd6e0fc18212bb98ee6e5d4f')

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "${_pkgname}.py" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
