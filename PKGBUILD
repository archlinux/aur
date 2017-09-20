# Maintainer: kaptoxic@yahoo.com

# Contributor: Jaime Gil de Sagredo <jaimegildesagredo@gmail.com

pkgname='checkstyle'
pkgver='8.2'
pkgrel=1
pkgdesc='A tool to help programmers write Java code that adheres to a coding standard'
depends=('java-environment')
arch=('i686' 'x86_64')
license=('LGPL2')
url='http://checkstyle.sourceforge.net'
source=(
  "https://sourceforge.net/projects/checkstyle/files/checkstyle/${pkgver}/${pkgname}-${pkgver}-bin.tar.gz/download"
  'checkstyle')
md5sums=('1a61a8dd39e8886fe59ec350686a033f'
         '2059277aee1e877eab1d127a0110d1c3')

function package() {
    local destdir="${pkgdir}/opt/${pkgname}"
    local bindir="${pkgdir}/usr/bin"

    mkdir -pv ${destdir}
    mkdir -pv ${bindir}

    cp -r "${srcdir}/${pkgname}-${pkgver}"/* ${destdir}

    install -m755 "${srcdir}/${pkgname}" ${bindir}
}
