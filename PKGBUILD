# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
 
pkgname=fourier-making-waves
pkgver=3.06
pkgrel=1
pkgdesc='An educational tool for making and exploring waves'
arch=('any')
url="http://phet.colorado.edu/en/simulation/fourier"
license=('GPL2')
depends=('java-runtime' 'sh')
source=(http://phet.colorado.edu/sims/fourier/fourier_en.jar
        ${pkgname}.sh)
noextract=(fourier_en.jar)
sha256sums=('5ea7978223de7f493c2ba04fcb7dbfebba7f36aa7c9bb47e1edf817845d34397'
            '00a2543a5a894196dce3225aad45744029b12852cc23bd7d433b2b3646805349')

package() {
  cd "$srcdir"

  install -Dm644 fourier_en.jar "${pkgdir}/usr/share/java/${pkgname}/fourier_en.jar"
  install -D ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
}
