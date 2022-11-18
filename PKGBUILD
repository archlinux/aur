# Maintainer: ivanp7 <ivanpzv8 at gmail dot com>

pkgname=common-lisp-hyperspec
pkgdesc='Common Lisp HyperSpec'

pkgver=7.0
_pkgver=7-0
pkgrel=1

arch=('any')
license=('custom')

source=("http://ftp.lispworks.com/pub/software_tools/reference/HyperSpec-${_pkgver}.tar.gz")
md5sums=('8df440c9f1614e2acfa5e9a360c8969a')

package ()
{
    mkdir -p -- "$pkgdir/usr/share/doc/${pkgname}"
    mkdir -p -- "$pkgdir/usr/share/licenses/${pkgname}"

    cp -a -t "$pkgdir/usr/share/doc/${pkgname}" "HyperSpec"
    install -m 644 -t "$pkgdir/usr/share/doc/${pkgname}" "HyperSpec-README.text"
    install -m 644 -t "$pkgdir/usr/share/doc/${pkgname}" "HyperSpec-Legalese.text"

    install -m 644 -t "$pkgdir/usr/share/licenses/${pkgname}" "HyperSpec-Legalese.text"
}

