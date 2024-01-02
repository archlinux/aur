# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: dale <dale@archlinux.org>

pkgname=mozilla-common
pkgver=1.4
pkgrel=7
pkgdesc='Helper for forks of the Mozilla codebase which still support NPAPI'
arch=('any')
license=('GPL')
url='https://www.mozilla.org/'
install=mozilla-common.install
source=('mozilla-common.sh'
	'mozilla-common.csh')
b2sums=('5387e1caa7f6bbacc598510d7415e7c3241f03f802a88d199f810d445a961dce30fd07c4c63e733a55b9b5eab1adeff3783ab0a2feb4009172369d20f80c1c60'
	'71a18f7dda59003f90063888e6442e5ae07b54c8041d4c671926a2fde719ed8d7d6693d009383fc2486850cf82986b663f7adf1b344dced33b0f95d0cb836e36')

package() {
	install -d "${pkgdir}/etc/profile.d/"
	install -m755 mozilla-common.{,c}sh "${pkgdir}/etc/profile.d/"
}
