# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantdepend
pkgname=$_pkgname
pkgver=20204923be4c9bc
pkgrel=1
pkgdesc="meta package for instantOS dependencies"
url="https://github.com/instantOS/instantMETA"
arch=('any')
license=('MIT')
depends=('picom-tryone-git'
    'arc-gtk-theme'
    'xorg-xrandr'
    'slop'
    'xorg-xsetroot'
    'xorg-fonts-misc'
    'autoconf'
    'automake'
    'binutils'
    'bison'
    'fakeroot'
    'flex'
    'gcc'
    'libtool'
    'm4'
    'make'
    'patch'
    'pkgconf'
    'p7zip'
    'dash'
    'tmux'
    'git'
    'subversion'
    'dialog'
    'neovim'
    'fzf'
    'ranger'
    'sl'
    'playerctl'
    'xclip'
    'ffmpeg'
    'feh'
    'arandr'
    'qt5ct'
    'lxappearance'
    'conky'
    'dunst'
    'xdotool'
    'wmctrl'
    'xclip'
    'nautilus'
    'cpio'
    'pavucontrol'
    'zsh'
    'zenity'
    'jgmenu'
    'jq'
    'htop'
    'pa-applet'
    'tkpacman'
    'network-manager-applet'
    'lxsession'
    'filemanager-actions'
    'autorandr'
    'xorg-xinput'
    'xfce4-power-manager'
    'blueman'
    'dmidecode'
    'alacarte'
    'imgur.sh'
    'gtk2-perl')

makedepends=('bash' 'curl')
provides=(instantdepend)
conflicts=(instantdepend)
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
    depends+=('yay'
        'xdragon'
        'urxvt-resize-font-git'
        'autojump'
        'youtube-dl'
        'paperbash'
        'zsh-syntax-highlighting'
        'rxvt-unicode-pixbuf'
        'rofi-git'
        'rangerplugins'
        'sideload'
        'irox'
        'st-luke-git'
        'plymouth-git'
        'plymouth-theme-instantos')

    cd $_pkgname
    mkdir -p ${pkgdir}/usr/share/instantos
    echo 'instantdependpackages' >${pkgdir}/usr/share/instantos/dpackages
}
