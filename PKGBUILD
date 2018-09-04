# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sabart Otto - Seberm <seberm[at]gmail[dot].com
# Contributor: Zsolt Udvari - uzsolt <udvzsolt X gmail X com>

set -u
pkgbase="adminer-skins"
pkgname=("${pkgbase}-"{brade,bueltge,cvicebni-ubor,galkaev,haeckel,hever,jukin,kahi,konya,nette,ng9,nicu,pappu687,paranoiq,pepa-linha,pilot,pokorny,price})
pkgver=20180609
pkgrel=2
pkgdesc='Adminer skins'
arch=('any')
url='https://www.adminer.org'
license=('Apache License, Version 2.0')
depends=('adminer')
provides=('adminer-skin')
conflicts=('adminer-skin')
source=()
for _skin in "${pkgname[@]}"; do
  _skin="${_skin#${pkgbase}-}"
  source+=("${_skin}.css::https://raw.github.com/vrana/adminer/master/designs/${_skin}/adminer.css")
  eval "package_adminer-skins-${_skin}() { set -u; install -Dpm644 '${_skin}.css' \"\${pkgdir}/usr/share/webapps/adminer/adminer.css\"; set +u; }"
done
unset _skin
sha256sums=('87a832112acf015566c41ea4b7e5f67c1e776eba16a933ce348c564dd6dad89b'
            '772d8d75c5a58894b3c45b6f1b96aa9377059b374b6851d362f6abbeb77e948d'
            '2aac952b12abaca9ac324b0aa9f585bf8477a6c122a865ed2a55fc4757b6304d'
            '000bfc1131417a39d20669f230d434817dcec04d9da5a437b9080c196f5a1972'
            '4ad15cab5b07719c66fa915a8ae66c8a26962aba6b8db02f2e21f0b5a5c87e4f'
            'e58b618996af64de84241db942ceb8f049af842272124481d09b310f720869f9'
            'a2cad46a758f92a9f3cb6816a428b47df74ef1cdf31bd8975ad8cafc0e8f12a8'
            'b0ef4026fda0bcbbda46e958e0d90df984d40debe23669892a66724ae37717c2'
            '802df31e87ec0d44e2aa6874b4c0227891b3cfe7500c6018ab46ea84b6f35894'
            'c60bbe41632088f8df6e212fd8faaf6bdc61264d1aa6f5e5be986829188be78c'
            'a82d803b62182cdc96cb8ecfa81d298727941e43b8e10a6e8e21e9aeff8a214a'
            '816c8e4391dd332edd170557b6229bdae8902d34e01d401057b270b021788a5a'
            'eb0983e47667a0c1971dcd650cfc8702d58de4f0063ca5aa102858e92ba17406'
            'bc831596f055911f6e60154fa7e2c49137e0128d30c3cbf83d3a4ef9f9b3de96'
            '6ea6a6b81588b8bcef7f7270a531a2094aac5da9e53569cb970b1acb2d765538'
            '34a4be73dfe1260142c1689a0a0e30d4f595f69fcdeb2af2ba6f2664795db573'
            '5759bffc06cdf390e225c4b07d407b70b07632d161d2fd290d836ddab2310a80'
            '5b9227abd244bbe2435a166bed9725ac98c2dadd8f32ec0e5859b54a2900e8bb')

set +u
