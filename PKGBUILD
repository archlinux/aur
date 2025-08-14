# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=openttd-ttdwin
pkgver=1
pkgrel=5
pkgdesc="Non-free TTD Windows data set for OpenTTD"
url="https://www.chrissawyergames.com/"
arch=(any)
license=(LicenseRef-Proprietary)
source=(
  # The TTD data files are protected by copyright and not included.
  # Please obtain them legally: https://www.transporttycoon.net/where
  file://gm_tt00.gm
  file://gm_tt01.gm
  file://gm_tt02.gm
  file://gm_tt03.gm
  file://gm_tt04.gm
  file://gm_tt05.gm
  file://gm_tt06.gm
  file://gm_tt07.gm
  file://gm_tt08.gm
  file://gm_tt09.gm
  file://gm_tt10.gm
  file://gm_tt11.gm
  file://gm_tt12.gm
  file://gm_tt13.gm
  file://gm_tt14.gm
  file://gm_tt15.gm
  file://gm_tt16.gm
  file://gm_tt17.gm
  file://gm_tt18.gm
  file://gm_tt19.gm
  file://gm_tt20.gm
  file://gm_tt21.gm
  file://sample.cat
  file://trg1r.grf
  file://trgcr.grf
  file://trghr.grf
  file://trgir.grf
  file://trgtr.grf
)
sha256sums=('18dd353059d43b2dc7f2afbf5b69b49eccf3ffdeccb6ae06074ae465aa76874e'
            'e240d73af1c8aaa3355015d798fcd36d22b42daf57622008b3dd92b98b52d17e'
            '5e56fa053591335a377e4e537c91c0136a487f2ca243771d28d16138ff5ce3f4'
            '21449a31adf846236e86f974521db9e67bd57274eccefe86b5f9e44b8dcc335a'
            '53bb20f1c9dad09fe708e1706eeeff2acedf0011a83efe96f4cd3944dbc131fb'
            '0a89aa923f11dc1481dae416f288e971f4e603d19e04fe03ed6c732e68cecc67'
            '42ab62031c64ef1128fb2dde507cbc4e1a5230ba6b89106569cf58e516adca67'
            '283d4089a3248a8edd94845e6bc85345b858e3df6cf87790b89989fc34bffd80'
            '0ef175f157deb696624ba1e8e7ad5a0a5545ce1f6d157147a6d8f9cddeb40995'
            '9c67957126d4a3f14d2f77a00c659b674d8cd9e2f272788083bf48354757f67e'
            'e61a917846b9e348c080dde1eb987ec51c92bd6846e6a6bc85fbd7f0dbcec3a3'
            'eb28b683d5dd48eb10023537b89b6f0fb8ab48d6926c19ac962bd0b2dc303c20'
            '45cd9abe01eef34008f97af2b6cec1e648b7a6ef07b3416f9456f477bee8850a'
            'a203fe0062e7245a7a830d498531014aa3d616c613e596fb36bafdffdd1f7da6'
            '440c8399d2373a0ca849f3bd7f6aef668b9b6e93b1e73f2071f59d5b1044a4e9'
            '2c42364813d2ed79c47ec46eb8ea6a7bca8b0f3a2500cb653d598e18bae0dd16'
            '2ce51aa7a402c8c9b5809a62e2e83386e362e3a5ccbc989a4d86de0e80ef6ef7'
            '9086a9bc881aa3219efc5b65fb0494f409996d9b37419222c3ffa8ec347fccee'
            'b01e1d01896895c1f871e23a032aaaeff4c93f823459403c825f2c7c632f8b9d'
            'e6514e5fd573b6ea4e683286b0244b084bcd8bc6f4cc335fc4d1960b3f2b086d'
            '6841606bc7528aa095767e830c8596d0e9284c49d00e411b7cd3d830713edeb4'
            '8ee052b0a7d47097f30e6e70163c7dc114757237813fe9cecebd629f7a94eb9c'
            '7135cb3055321e38eba496e7efccb17bcd99d3c2ab85d84d7e3de70f8b38a394'
            '508cea9a82de92db3193521b3506e034deb850ff52a4c9dc0fb9111b76e3176b'
            'adca1af22b2e9b77c6724f84670e670e5ebb573e6df9b7ae251f910b9df485e7'
            '6b60226f8a1a71cda816665495d7d1fe618cce471681d9344974805909c4b75e'
            '5a3540c517373cddb1ab4729aba0956144845e1c5cecb715cfddb7c56357fed7'
            'd03eb142ee2ccae50bb8e337959da1ac68f32cbbac1ebde858104baf63f121fd')

package() {
  local gamedir="$pkgdir/usr/share/openttd"
  install -Dm644 trg{1,c,h,i,t}r.grf sample.cat -t "$gamedir/data"
  install -Dm644 gm_tt{00..21}.gm -t "$gamedir/gm"
}
