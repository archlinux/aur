# Maintainer: Librewish <librewish@gmail.com>


pkgbase=manjarowish-lxqt-kwin-light-settings
_gitname=manjarowish-lxqt-kwin-light-settings
pkgname=(
    'manjarowish-lxqt-kwin-light-settings'
    )
pkgver=0.1
pkgrel=1
arch=('any')
_branch='master'
url="https://github.com/librewish/manjarowish-lxqt-kwin-light-settings"
license=('GPL')
makedepends=('git')
source=("git+$url.git#branch=${_branch}")
sha256sums=('SKIP')

_install() {
    if [[ -d $srcdir/$_gitname/$1/etc ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/etc $pkgdir
    fi

    if [[ -d $srcdir/$_gitname/$1/usr ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/usr $pkgdir
    fi
    
    if [[ -d $srcdir/$_gitname/$1/skel ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/skel $pkgdir/etc
    fi

}

package_manjarowish-lxqt-kwin-light-settings() {
    pkgdesc='Manjarowish Linux Lxqt-Kwin light settings'
    depends=(
        'kvantum-qt5'
        'plank'
        'lxqt-about'
        'lxqt-admin'
        'lxqt-config'
        'lxqt-globalkeys'
        'lxqt-notificationd'
        'lxqt-openssh-askpass'
        'lxqt-panel'
        'lxqt-policykit'
        'lxqt-powermanagement'
        'lxqt-qtplugin'
        'lxqt-runner'
        'lxqt-session'
        'lxqt-sudo'
        'lxqt-themes'
        'pcmanfm-qt'
        'lximage-qt'
        'qterminal'
        'pavucontrol-qt'
        'lxqt-archiver'
        'qlipper'
        'qps'
        'mojave-gtk-theme-git'
        'papirus-icon-theme'
        'noto-fonts'
        'preload'
        'haveged'
        'irqbalance'
        'systemd-swap'
        'nohang-git'
        'sddm-kcm'
        'sddm-theme-sugar-candy-git'
        'kwin'
        'kde-cli-tools'
        'kwin-decoration-sierra-breeze-enhanced-git'
        'kwin-effects-yet-another-magic-lamp'
        'kwin-scripts-forceblur'
        )
    optdepends=(
        'timeshift-autosnap'
        'grub-btrfs'
        )    
    install=manjarowish-lxqt-kwin-light-settings.install
    conflicts=('manjarowish-dark-settings-settings','manjaro-kde-settings','manjarowish-light-settings-settings')
    replaces=('manjarowish-dark-settings-settings','manjaro-kde-settings','manjarowish-light-settings-settings')
    provides=('manjaro-desktop-settings')
    conflicts=('manjaro-desktop-settings' 'plasma-workspace')

    _install ''
}

