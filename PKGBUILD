pkgname=heart-of-darkness
pkgver=1.1_uk
pkgrel=1
pkgdesc="Heart of Darkness running under hode engine"
arch=(any)
url=https://heartofdarkness.ca/
license=('custom:Infogrames EULA')
depends=(hode-git)
install=success.install
source=(https://heartofdarkness.ca/Download/speedrun/Heart%20of%20Darkness%20UK.iso)
md5sums=(a16c091967d16d830910383390306b04)
build(){
	bsdtar xf HeartOfDarkness_En.EXE
}
package(){
	install paf/hod.paf SETUP.DAT *_HOD.{LVL,SSS,MST} hodsuccess.wav -Dt "$pkgdir"/usr/share/$pkgname
}
