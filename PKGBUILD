# Maintainer: villamorrd <villamorrd@students.nu-moa.edu.ph>
pkgname=davinci-resolve-checker-git
pkgver=5.2.8
pkgrel=1
pkgdesc="Check your system configuration and hardware for ability to successfully run DaVinci Resolve"
arch=('any')
url="https://github.com/Ashark/davinci-resolve-checker"
license=('GPL-3.0')
depends=(
	'expac'
	'mesa-utils'
	'python-distro'
	'clinfo'
	'python-pylspci'
)
makedepends=('git')
conflicts=('davinci-resolve-checker')
source=(
    "git+https://github.com/Ashark/davinci-resolve-checker.git"
    "resolve-checker"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

package() {
    mkdir -p "$pkgdir/opt/davinci-resolve-checker"
	cp -r davinci-resolve-checker "$pkgdir/opt"
	ls
	install -Dm755 resolve-checker "$pkgdir/usr/bin/davinci-resolve-checker"
}
