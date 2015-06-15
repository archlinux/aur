# Contributor: Gadget3000 < gadget3000 at msn dot com>
# Contributor: Stefan Lohmaier <noneuss AT gmail DOT com>
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=boswars-addons
pkgver=2.7
pkgrel=1
pkgdesc="Addons for boswars."
arch=('i686' 'x86_64')
url="http://www.boswars.org/addons/addons.shtml"
license=('GPL')
depends=("boswars>=2.7")
source=(http://www.boswars.org/addons/greenlands.map.tgz
        http://www.boswars.org/addons/obese.map.tgz
	http://www.boswars.org/addons/obese2.map.tgz
        http://www.boswars.org/addons/wargrounds.map.tgz
        http://www.boswars.org/addons/wetlands03.map.tgz)
sha512sums=('61988ff099b4a57e7ff97bc98e152e7bb448bdab52c03e7678e85438802b96e81220554146dc7439f90d4e8e8b2a59f13c778fc978c28000617163177c6af55c'
            'b988aed5040fefe9ceb8fbc14b162dac0492e88de9f4cfc24e693a2f8edf1e8c02dc22797b8be270bbcfaf19dfd80c8aa1267b91067d47b565adbbd31500b243'
            '574ea5f0c962c44e7694fe01e45b31b9b220d9aa67bdbef6b57ca6241977e0cc1e83a077a4111f685012df923df00ee2d44441b5a82d715d000a60e102f5129c'
            'dce27d013a596259190e34e401f7103f68e2937ae91585dec86c44e51366079db068d83f92ecc7973cc19b1140f0fc9df4510dee677f6f02db47f734fecc6d73'
            '9378079ea4c798210305d7681e1e2c23df825178644dc0b486306ca43d2be4150d89897eac3420e28af9b74d0bcf77b687386a2cecf8a6645c72f3509747ce47')

package() {
  mkdir -p ${pkgdir}/opt/bos/maps
  mv *.map ${pkgdir}/opt/bos/maps
}

# vim:set ts=2 sw=2 et:
