# Maintanier: graysky <graysky AT archlinux dot us>
pkgname=mplayer-resumer
pkgver=20130711
pkgrel=1
pkgdesc='An mplayer wrapper script that will resume playback of previously-stopped video where you left off.'
arch=('any')
license=('GPL')
url="https://github.com/Human/mythic.tv-contributed-code/archive/master.zip"
depends=('mplayer' 'perl' 'perl-shell')
source=("https://github.com/Human/mythic.tv-contributed-code/archive/master.zip")
sha256sums=('2cdf65869e799a9462cca7f332bd49aba49ae7db5bf647ad450396122fe6c78a')

package() {
	install -Dm755 "$srcdir/mythic.tv-contributed-code-master/mplayer-resumer.pl" "$pkgdir/usr/bin/mplayer-resumer"
}
