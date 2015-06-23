pkgname=pacleaner
pkgver=2.0
pkgrel=5
scriptver=0.2.0
pkgdesc="Script to clean up pacmans cache in a more flexible way than pacman -Sc[c]."
arch=(i686 x86_64)
depends=('python' 'python-hurry-filesize')
url=(https://github.com/havarnov/pacleaner)
source=("https://github.com/lesebas/pacleaner/archive/"${scriptver}".tar.gz")
md5sums=('0d4a3aaa171bea2b3add3d2c1457bb4a')
license=('GPL')

package(){

cd_pacleaner=/usr/share/pacleaner/

mkdir -p "${pkgdir}${cd_pacleaner}"
mkdir -p "${pkgdir}/usr/bin/"
cp "${srcdir}"/"${pkgname}"-"${scriptver}"/"${pkgname}.py" "${pkgdir}${cd_pacleaner}${pkgname}.py"
cp "${srcdir}"/"${pkgname}"-"${scriptver}"/"${pkgname}_config" "${pkgdir}${cd_pacleaner}${pkgname}_config"
cp "${srcdir}"/"${pkgname}"-"${scriptver}"/"README" "${pkgdir}${cd_pacleaner}README"
ln -s "${cd_pacleaner}${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
chmod +x "${pkgdir}${cd_pacleaner}${pkgname}.py"

}
