# Maintainer: Maximilian Edison <maximilianedison at gmail dot com>
# Maintainer: Max Base <maxbasecode at gmail dot com>
pkgname="ssh_system_finder"
pkgver="1.0.0"
pkgrel="1.0"
pkgdesc="Scan an IP or local network and identify systems that have SSH enabled."
arch=('any')
url="https://github.com/basemax/sshfinderc"
license=('GPL3')
maintainer=("Maximilian Edison <maximilianedison@gmail.com>"
            "Max Base <maxbasecode@gmail.com>")
depends=('gcc' 'make')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')


package() {
    cd "$srcdir/sshfinderc"
    make 
    sudo install -Dm755 "$srcdir/sshfinderc/ssh_system_finder" "/usr/local/bin/ssh_system_finder"
}
