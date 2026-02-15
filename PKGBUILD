pkgname=pacleaner
pkgver=2.4
pkgrel=2
scriptver=0.2.4
pkgdesc="Script to clean up pacman cache in a more flexible way than with paccache or pacman itself. Fully configurable and flexible"
arch=(i686 x86_64)
depends=('python' 'python-hurry-filesize')
url="https://github.com/lesebas/pacleaner"
source=("https://github.com/lesebas/pacleaner/archive/"${scriptver}".tar.gz")
md5sums=('ee8b6f8b5389204dfa062b124eb83149')
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
