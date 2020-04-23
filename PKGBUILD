pkgname=pacleaner
pkgver=2.1
pkgrel=2
scriptver=0.2.1
pkgdesc="Script to clean up pacman cache in a more flexible way than pacman -Sc[c]."
arch=(i686 x86_64)
depends=('python' 'python-hurry-filesize')
url="https://github.com/lesebas/pacleaner"
source=("https://github.com/lesebas/pacleaner/archive/"${scriptver}".tar.gz")
md5sums=('a0a0de30dd000edda9b2c47a94b63e58')
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
