pkgname=yauri
pkgver=2.0.2
pkgrel=1
url="https://gitlab.com/PieyIsAPie/yauri"
pkgdesc="yauri, the gayest aur helper ever, all fitting into 1 file."
arch=('any')
license=('GPL')
sha512sums=('SKIP')
source=("git+https://gitlab.com/PieyIsAPie/yauri.git")
depends=('python3' 'python-requests' 'pacman-contrib' 'git' 'python-colorama' 'sudo' 'fzf' 'pacman')

package() {
    install -Dm755 yauri/source/yauri.py "$pkgdir/usr/share/yauri/yauri.py" ;
    install -Dm755 yauri/source/libyauri.py "$pkgdir/usr/share/yauri/libyauri.py" ;
    install -Dm755 yauri/source/taurist.py "$pkgdir/usr/share/yauri/taurist.py" ;

    install -Dm755 yauri/source/launchers/yauri "$pkgdir/usr/bin/yauri" ;
    install -Dm755 yauri/source/launchers/taurist "$pkgdir/usr/bin/taurist" ;
}
