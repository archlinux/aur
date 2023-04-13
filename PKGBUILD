# Maintainer: Your Name <youremail@domain.com>
pkgname=hamachi-openrc
pkgver=1.0
pkgrel=1
pkgdesc="A Hamachi service for OpenRC."
arch=('any')
url="https://gitea.it/KhomyaK_HTF/hamachi-openrc"
license=('')
depends=('logmein-hamachi' 'git' 'pacman' 'openrc' 'networkmanager' 'networkmanager-openrc')
source=('git+https://gitea.it/KhomyaK_HTF/hamachi-openrc')
md5sums=('SKIP')

package() {
        cd "hamachi-openrc"
    	install -Dm644 hamachi "$pkgdir/etc/init.d/hamachi"
	chmod +x "$pkgdir/etc/init.d/hamachi"
}
