# Contributor: wido <widomaker2k7@gmail.com>

pkgname=opera-i18n
pkgver=11.50
_pkgver=1150
pkgrel=1
_languages=af,az,be,bg,bn,cs,da,de,el,en,en-GB,es-ES,es-LA,et,fi,fr,fr-CA,fy,gd,hi,hr,hu,id,it,ja,ka,ko,lt,mk,ms,me,nb,nl,nn,pa,pl,pt-BR,ro,ru,sk,sr,sv,sw,ta,te,th,tr,uk,uz,zh-tw,zh-cn,zu
pkgdesc="Language packs for Opera"
arch=('any')
license=('custom:opera')
url="http://www.opera.com/"
depends=("opera")
eval source=(http://www.opera.com/download/lng/${_pkgver}/ouw${_pkgver}_{${_languages}}.lng)

build() {
  cd ${startdir}/src
  for lang in $(echo "${_languages}" | sed 's|,| |g'); do
      install -D -m 644 ouw${_pkgver}_${lang}.lng ${pkgdir}/usr/share/opera/locale/${lang}/ouw${_pkgver}_${lang}.lng
  done
}

md5sums=('9f75460e0a705df483cf864ed3a2a75b'
         '6839a0910afe7a441b3ba3bf04b6315c'
         '2e584cb4c95d6d3c10d86744ab73354a'
         '710852f58f622a6e88413b0585b4d866'
         '591a1253878622f1133feedafe6fab3b'
         'dcd2095ce149bc2efb0f00fa103d071b'
         '300eb09f89ce9e9c79ea8580f9cb7f7b'
         '9d1231e914c2657fe76ae988c1dbef07'
         '1b8483cb861c6dc234b6d4ac51be0392'
         '27a82c56164fd87311c19afcd5c4d4a3'
         '149d1326d5e5265ed1b98effe29938c8'
         '180185fd50952691536969046826e62a'
         '6d00a480daf610c571eaf2ec951c0c85'
         '9e6854fb03c07b458db3bafcc7877795'
         '07315286bd6d75ad6cad7243467ede99'
         '07a339eb95e3b207683fd0508a735e54'
         'f9baab00328833b72c49cd937cb2d4e7'
         '46c24d15870ea8117e532d7e55e779ca'
         'ed5895a4b109e837ec232c1f7d8550e7'
         '8ae96e28ff71f3bba09c99e666f45621'
         'd23e4c903f20799790e10e387eb3454a'
         'd0d970db7b4fd5c8204198aedaf2fe28'
         '8abaca44d2f12c51d1e9fcc0678f2ac3'
         '8aef40538f1bd4cdc450647480987c5f'
         '074050a610ac5d8e6529de1ee4713f31'
         '7bf1159e60bbbd7219a73d329729740d'
         '9a7173bdb751c98c5ea3fb2786a161d8'
         'f4c20c20fb68193836a85ed75a4f1e71'
         '97ae2e1630855c9bf5e0045541d519cf'
         '2f661574a7e834403a385b90ed7fa605'
         'b1201f2d12c0a4b355a11bc033c2a4ef'
         '88d8bc595a322b984c4b8a46ea29d9b1'
         '160fbd8395328b860eb5abf037c44509'
         '26681eaae005327d00eea81fcc1ccc54'
         '41f23a5d6b1ae9d1a4e3b0bbcf7bc027'
         'dc2287b05d15be6368458402657aebee'
         'f3eedca1234eb3b75446d4709200ee0f'
         'c20ec729739774f31e266f261f4aae26'
         '36ddfcb78810dfb70d3fc0047b830140'
         '941e691039c7c87bddb4a0afa2d0c31b'
         'e2d50f04507e26df29cc5fbe938cae01'
         '0313f16fbb1c78ca04a12e74680692a9'
         '9d7ff761ef959ddec5f8c56db2e9e94f'
         '4ae3e0e97b1f7aff434e56d99fe6e4e1'
         '086438497fa0b3ef1644957486a7481a'
         '38019752b100e2a2f603d2546da4a10b'
         '1f3256399ecf0546eba6c4b8dc563121'
         'b8ec347f554a5aa132f485bad404e3d4'
         '833c409488db22f890bc8e81c984fb28'
         'e69c3d2d6e35ce598635e73cfcc84e02'
         'dce7c507a0d5399fe50443427ed851af'
         'cfee3ac5924499995ed82e1677fc757d')
