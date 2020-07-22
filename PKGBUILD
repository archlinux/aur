# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantos
pkgname=$_pkgname
pkgver=9851542
pkgrel=1
pkgdesc="meta package for instantOS"
url="https://github.com/instantOS/instantMETA"
arch=('any')
license=('MIT')
depends=('git')

makedepends=('bash' 'git')
provides=(instantos)
conflicts=(instantos)
source=("$_pkgname::git+https://github.com/instantOS/instantMETA.git")

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
    echo "no prepare"
}

build() {
    cd $_pkgname
    echo "no build"
}

package() {

    depends+=('instantdotfiles'
        'instantutils'
        'instantwallpaper'
        'instantassist'
        'instantthemes'
        'instantwidgets'
        'instantcursors'
        'instantshell'
        'otf-nerd-fonts-fira-code'
        'instantconf'
        'instantwm'
        'instantlock'
        'instantmenu'
        'instantwelcome'
        'instantsettings'
        'islide'
        'imenu'
        'instantnotify'
        'instantsupport'
        'grub-instantos')

    cd $_pkgname

    mkdir -p ${pkgdir}/usr/share/instantos
    echo 'instantpackages' >${pkgdir}/usr/share/instantos/packages
}
