# Maintainer: Saurabh Kumar Sharma <imesskayesss@protonmail.com>

pkgname=lolminer
pkgver=1.32
pkgtag=a
pkgrel=1
pkgdesc="Unofficial installer for lolMiner"
arch=("x86_64")
url='https://github.com/Lolliedieb/lolMiner-releases'
license=('custom: lolMiner License Agreement')
options=('!strip')
source=("https://github.com/Lolliedieb/lolMiner-releases/releases/download/${pkgver}/lolMiner_v${pkgver}${pkgtag}_Lin64.tar.gz")
sha256sums=('SKIP')

package(){
    install -dm755 "${pkgdir}/"{opt,usr/bin/}
    cp -rL "${srcdir}/${pkgver}${pkgtag}" "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/lolMiner" "${pkgdir}/usr/bin/lolminer"
    install -D "${srcdir}/${pkgver}${pkgtag}/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
