# Maintainer: Saurabh Kumar Sharma <imesskayesss@protonmail.com>

pkgname=lolminer
notagver=1.84
pkgtag=
pkgver=${notagver}${pkgtag}
pkgrel=1
pkgdesc="Unofficial installer for lolMiner"
arch=("x86_64")
url='https://github.com/Lolliedieb/lolMiner-releases'
license=('custom: lolMiner License Agreement')
options=('!strip')
source=("https://github.com/Lolliedieb/lolMiner-releases/releases/download/${pkgver}/lolMiner_v${pkgver}_Lin64.tar.gz")
sha256sums=('SKIP')

package(){
    install -dm755 "${pkgdir}/"{opt,usr/bin/}
    cp -rL "${srcdir}/${pkgver}" "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/lolMiner" "${pkgdir}/usr/bin/lolminer"
    install -D "${srcdir}/${pkgver}/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
