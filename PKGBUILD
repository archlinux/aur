# Maintainer: Joao Pedro (joaopedroaats) <joaopedroaats@pm.me>

pkgname=joaopedro
pkgver=1.0.0
pkgrel=1
pkgdesc='Only basic configs'
arch=('any')
url='https://github.com/joaopedroaats/dotfiles'
license=('MIT')
depends=(
	"discord" "zoom" "krita" "vlc"
	"plank"
	"bitwarden"
	"qbittorrent" "stremio"
	"google-chrome" "tor-browser" "firefox-developer-edition"
	"ttf-fira-code" "ttf-ibm-plex"
	"kvantum-qt5-git" "kvantum-theme-layan-git"
	"gwe" "cuda-10.2"
	"cpu-x-git" "s-tui" "stress"
	"gparted-git" "gsmartcontrol"
	"woeusb"
	"gotop-bin" "xclip" "neofetch"
	"zsh" "oh-my-zsh-git"
	"antigen-git" "spaceship-prompt-git"
	"spotify" "spotify-adblock-linux"
	"spicetify-cli" "spicetify-themes-git"
	"vsce" "exercism" "wakatime"
	"docker" "virtualbox-ext-oracle"
	"insomnia-bin" "postman-bin"
	"visual-studio-code-insiders-bin" "android-studio"
	"netbeans8" "emacs" "emacs-doom-themes-git" "fd" "ripgrep"
	"nvm-git" "yarn"
	"glassfish5"
	"apache" "mysql" "php" "php-apache" "phpmyadmin"
	"elixir" "inotify-tools"
	"gnome-keyring")

source=("dotfiles.tar.gz::https://github.com/joaopedroaats/dotfiles/archive/v${pkgver}.tar.gz")


# makepkg -g >> PKGBUILD && makepkg
md5sums=('e284b567dc8afa79ace789dd3042bd79')


build() {
	true
}

package() {
	mv "$srcdir/dotfiles-$pkgver" ~/dotfiles-new
}

