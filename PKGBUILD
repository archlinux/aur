# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sabart Otto - Seberm <seberm[at]gmail[dot].com
# Contributor: Zsolt Udvari - uzsolt <udvzsolt X gmail X com>

set -u
pkgbase="adminer-skins"
pkgname=("${pkgbase}-"{brade,bueltge,cvicebni-ubor,galkaev,haeckel,hever,jukin,kahi,konya,nette,ng9,nicu,pappu687,paranoiq,pepa-linha,pilot,pokorny,price})
pkgver=20150806
pkgrel=1
pkgdesc='Adminer skins'
url='http://www.adminer.org'
arch=('any')
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
sha256sums=('4223123faaa06e09503ee88a3c422141ca0755e6f8de5835ce1957ba0cfeec11'
            'e7293e1ba36619e2fac60fa2a9bb1a75dada3700512a12d0a692d91d3ba85eb4'
            '529046f59eeae650913322a7b500c435944d435bcddc7f1689fd8167071a5f46'
            'db299f10a11b492a2d16821f2347f8b89f0da76e103db29731ea7ac0cabe6873'
            'cc79cbdf83fe809fcc6b166a0645a201368538fd9624d7cff007bb62ca6fb2e0'
            '1eca9b1ff30ff6dfb7051a44beed31d72135b79a2f2b05edebb98d1eef8bf155'
            'b7194678b1b6872212b85f0e5100bd0b9a097fca5bef57b862c4f205e467e89f'
            'b0ef4026fda0bcbbda46e958e0d90df984d40debe23669892a66724ae37717c2'
            'd050b8630e5019eef09afc802b99b43016a9514aaad785b01278632a8cd27cd1'
            '632965d2ca4440d73a27c47ac208da30e57ac018395411bcdd8528d108a56f2a'
            'a82d803b62182cdc96cb8ecfa81d298727941e43b8e10a6e8e21e9aeff8a214a'
            '9edf7f6bebdea1c7045c56d8c5238ffb491edaada98805c0b58ee53f2301e682'
            '906524e9d3f2d34cd4ecec27f3fbd1f4457b4510e696d6ce6b2594612c96b185'
            'ba758be19293ce11698ab8c64e15653bd77f08ef754b12dcdc7eda994f2c5324'
            '2e73d03c4e2a239fb362ccb7670c57275008ab0249bb093f67020e1d52c95399'
            '504ce185b2c7f51762baf24dd499a989cfb081a49a38fbca766181b8be29f206'
            '219a3fc765f26830a25c39631868c203b34b908ed05430b251953c196ab83492'
            'ae36ed3d7ea9a263ce5f15ffe5cf3f15a5c296cd26afb04cf4929c7ae9faf41d')

set +u
