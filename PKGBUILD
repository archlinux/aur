# Maintainer: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=cozy
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="A personal cloud you can hack, host and delete, packaged without any reverse proxy solution."
arch=('any')
url="https://cozy.io/"
license=('GPL3')
groups=()
depends=('ca-certificates' 'couchdb' 'supervisor' 'bash' 'curl' 'git' 'imagemagick'
    'openssl' 'libxml2' 'libxslt' 'python2' 'python2-setuptools' 'python2-virtualenv' 'sqlite'
    'nodejs-lts-bin' 'pwgen' 'pngcrush' 'lsof' 'cozy-management')
makedepends=()
checkdepends=()
optdepends=('libjpeg-turbo: Needed for the Kresus app'
            'libyaml: Needed for the Kresus app')
provides=("cozy")
conflicts=("cozy")
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("https://raw.githubusercontent.com/cozy/cozy-debian/master/supervisor-cozy-controller"
        "configure-cozy-domain")
noextract=()
md5sums=("SKIP"
         "603ae0e25b7bf756b3bdc5da20efeec5")

build() {
    echo "Hello world" > /dev/null
}

package() {
    mkdir -p $pkgdir/usr/share/cozy
    mkdir -p $pkgdir/etc/cozy

    cp supervisor-cozy-controller $pkgdir/usr/share/cozy
    mkdir -p $pkgdir/usr/bin
    cp configure-cozy-domain $pkgdir/usr/bin
}
