# Maintainer: Alexander Agura <agur4ik09@gmail.com>
pkgname=find-the-command
pkgver=1.0.2
pkgrel=1
pkgdesc="Interactive command-not-found hook for bash and zsh using the power of pacman"
arch=('any')
url="https://github.com/agur4ik/find-the-command"
license=('custom:WTFPL')
depends=('pacman>=5.0')
optdepends=('zsh: cool interactive shell with plenty of features')
backup=('usr/lib/systemd/system/pacman-files.service'
		'usr/lib/systemd/system/pacman-files.timer')
install=find-the-command.install
source=("https://github.com/agur4ik/$pkgname/archive/$pkgver.tar.gz")
md5sums=(74442eed8f114ffcdad379c26c2555d7)

package() {
	cd "$pkgname-$pkgver"
	cp -a * $pkgdir/
}
