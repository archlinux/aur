# Maintainer: Varshit Bhat <varshitbhat@gmail.com>

pkgname=wfrcrdrbind-git
pkgver=1.0
pkgrel=2
pkgdesc="Binding to simplify wf-recorder"
arch=('any')
url="https://gitlab.com/varshitbhat/wfrcrdrbind"
license=('GPLv3')
depends=('wf-recorder-git' 'libnotify' 'slurp' 'xdg-user-dirs')
source=('https://gitlab.com/varshitbhat/wfrcrdrbind/raw/master/wfrcrdrbind')
noextract=('wfrcrdrbind')
md5sums=('SKIP')

package() {
	install -Dm755 "${srcdir}/wfrcrdrbind" "${pkgdir}/usr/bin/wfrcrdrbind"
}
