# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=singularityviewer-skins
pkgver=1.8.7
pkgrel=1
pkgdesc="Extra skins for Singularity (and any other V1-type viewers) for Second Life (secondlife) and OpenSim (opensimulator)."
url="http://github.com/singularity-viewer/SingularityViewer/tree/master/indra/newview/skins"
license=('GPL')
depends=('unzip' 'singularityviewer')
conflicts=('singularityviewer-skins-git')
arch=('any')

source=("https://bitbucket.org/SingularityViewer/singularityviewer/downloads/SingularSkins%20${pkgver}.zip")
noextract=("SingularSkins%20${pkgver}.zip")
md5sums=('44d15337e9aa69b58a3046a40d5ad0e2')

package() {
cd $srcdir
mv "SingularSkins%20${pkgver}.zip" "SingularSkins-${pkgver}.zip"
unzip "SingularSkins-${pkgver}.zip"
cd skins

mkdir -p $pkgdir/opt/singularityviewer/skins
cp -R * $pkgdir/opt/singularityviewer/skins/

}
