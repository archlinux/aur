pkgname=weasis-bin
pkgver=3.0.4
pkgrel=1
pkgdesc="Weasis is a multipurpose DICOM viewer with a highly modular architecture"
arch=('any')
url="https://nroduit.github.io/"
license=('EPL-2.0')
groups=('')
depends=('java-runtime')
options=('!strip' '!emptydirs')
source=("https://netcologne.dl.sourceforge.net/project/dcm4che/Weasis/${pkgver}/weasis-portable.zip")
sha512sums=('ddfc88594fa8ae481d1ccc9df8f7db5e8e937ea1744804f80dda1de8037cd7904777fd99503f15da1de2eb772d14420f7691c97d3b1173b7707338e23c5696b7')

package(){
        mkdir -p $pkgdir/opt
        
        cp -a "${srcdir}" "${pkgdir}/opt/${pkgname}"
        
        mkdir -p "${pkgdir}/usr/bin"
        ln -s "/opt/$pkgname/viewer-linux.sh" "$pkgdir/usr/bin/weasis"
}
