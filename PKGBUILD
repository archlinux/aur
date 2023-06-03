pkgname="apsynsim"
pkgver=2.2
pkgrel=1
pkgdesc="Aperture Synthesis Simulator for Radio Astronomy"
arch=("x86_64")
url='https://launchpad.net/apsynsim'
license=('GPL3')
makedepends=('python-numpy' 'python-scipy' 'python-matplotlib' 'tk')
source=("https://launchpad.net/${pkgname}/trunk/i-train-2022/+download/${pkgname}_I-TRAIN_Release_${pkgver}b.tar.gz")
sha256sums=('445faba97c42361296a428b6992ff3e7af2165caa461321fe9f069f8b0f9faa1')

package() {
    install -d "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname}/" "${pkgdir}/opt/${pkgname}"
}

