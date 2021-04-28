# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=velvetyne-fonts
pkgname=("otf-$pkgbase")
pkgver=0
pkgrel=2
pkgdesc='A package depending on all the released fonts from Velvetyne Type Foudry'
arch=('any')
url='http://velvetyne.fr'
license=('OFL' 'custom:Velvetyne Open License')
_otf=('avara'
      'backout'
      'cantique'
      'compagnon'
	  'daubenton'
      'format-1452'
      'happy-times'
      'kaerukaeru'
      'ouroboros'
      'mourier'
      'murmure'
      'vg5000')

package_otf-velvetyne-fonts() {
    depends=("${_otf[@]/#/otf-}")
}

