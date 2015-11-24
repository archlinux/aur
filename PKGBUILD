pkgname=trueconf
pkgver=1.3.1.1038
pkgrel=1
pkgdesc="SystemTap provides free software (GPL) infrastructure to simplify the gathering of information about the running Linux system."
url="http://trueconf.com/"
arch=('x86_64')
license=('custom:TrueConf')
depends=('elfutils' 'nss' 'python2')
source=(http://www.trueconf.ru/download/beta/trueconf-client-${pkgver}-amd64.pkg.tar.xz)
sha1sums=('350e2fa3ba24d99eceb1544421f4998fa2a8b52b')
install=.INSTALL


build() {
    cp ${srcdir}/.INSTALL ../
}

package() {
    cp -r ${srcdir}/opt ${pkgdir}
    cp -r ${srcdir}/usr ${pkgdir}
}

# vim:set ts=2 sw=2 et:
