# Contributor: Jaime Gil de Sagredo <jaimegildesagredo@gmail.com
# Maintainer: kaptoxic@yahoo.com

pkgname='checkstyle'
pkgver='6.18'
pkgrel=1
pkgdesc='A tool to help programmers write Java code that adheres to a coding standard'
depends=('java-environment')
arch=('i686' 'x86_64')
license=('LGPL2')
url='http://checkstyle.sourceforge.net'
source=(
    "https://sourceforge.net/projects/checkstyle/files/checkstyle/${pkgver}/${pkgname}-${pkgver}-bin.tar.gz/download"
    'checkstyle')
md5sums=('dd3456e70fb91f7d77fb4666e89969e0'
         '2059277aee1e877eab1d127a0110d1c3')

function package() {
    local destdir="${pkgdir}/opt/${pkgname}"
    local bindir="${pkgdir}/usr/bin"

    mkdir -pv ${destdir}
    mkdir -pv ${bindir}

    cp -r "${srcdir}/${pkgname}-${pkgver}"/* ${destdir}

    install -m755 "${srcdir}/${pkgname}" ${bindir}
}
