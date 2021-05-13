#Maintainer: alecromski alecromski@gmail.com

pkgname=pomodoro.py
pkgver=1.0
pkgrel=1
pkgdesc="Pomodoro notify with polybar output"
arch=('any')
url="https://github.com/kawaegle/Pomodoro"
license=('GPL')
depends=('python>=3.8' 'libnotify>=0.7.5' 'dunst')
provides=('pomodoro.py')
optdepends=('ttf-font-awesome: show beautifull icon')
conflics=('pomodoro')
source=("https://github.com/kawaegle/Pomodoro/")
md5sums=('SKIP')
package(){
	cd Pomodoro
	printf "$(pwd)"
	cp pomodoro.py $HOME/.local/bin.
	printf "Install finished"
}
