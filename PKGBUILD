# Maintainer: Colin Berry colinb969@gmail.com

pkgname=('manjaro-icewm-settings-minimal')
pkgver=20190625
pkgrel=1
arch=('any')
url="https://github.com/colin969/manjaro-icewm-settings-minimal"
_branch=master
license=('GPL')
pkgdesc='Manjaro Linux icewm settings (minimal)'
groups=('icewm-manjaro')
depends=('icewm'
        'manjaro-base-skel'
        'nerd-fonts-terminus'
        )
makedepends=('git')
optdepends=('')
#conflicts=('manjaro-desktop-settings')
#provides=('manjaro-desktop-settings')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    date +%Y%m%d
}

package_manjaro-icewm-settings-minimal() {
	cd $pkgname
    install -d $pkgdir/etc
    cp -r skel $pkgdir/etc
}
