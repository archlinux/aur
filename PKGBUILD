# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: wido <widowild[AT]myopera[DOT]com>

pkgname=opera-i18n
pkgver=12.00
_pkgver=1200
pkgrel=1
_languages=af,ar,az,be,bg,bn,cs,da,de,el,en,en-GB,es-ES,es-LA,et,fa,fi,fr,fr-CA,fy,gd,he,hi,hr,hu,id,it,ja,ka,kk,ko,lt,mk,ms,me,nb,nl,nn,pa,pl,pt,pt-BR,ro,ru,sk,sr,sv,sw,ta,te,th,tl,tr,uk,ur,uz,vi,zh-tw,zh-cn,zu
pkgdesc="Language packs for Opera"
arch=('any')
license=('custom:opera')
url="http://www.opera.com/"
depends=("opera")
eval source=("http://www.opera.com/download/lng/${_pkgver}/ouw${_pkgver}_{${_languages}}.lng")

build() {
  cd "${srcdir}"
  for lang in $(echo "${_languages}" | sed 's|,| |g'); do
    install -D -m 644 ouw${_pkgver}_${lang}.lng "${pkgdir}/usr/share/opera/locale/${lang}/ouw${_pkgver}_${lang}.lng"
  done
}

sha256sums=('25cef9643067912989846a7cbf0ccda0419a36393bb242f5e69dbd6b9c578fa6'
            '11c254971e07809575f11c5f6fc0e4dbb387a1deb79e239b223432eaf6398b4e'
            'bfef4163af22a2da20f72b099a871ea167bd6493d607ee92cce5f4f7346645d9'
            '71e633719a3aa1f7a2281a3e0cb8ab3e7195792fa16bac65ccd0ec320ee9cb9c'
            'ed6a6075cbd450967a06f9200cc2688bf595cce251b81ac821161de8f0921baa'
            '201412db0edb0e7108408a2360d34fe49f3fc2df7688b2219c4fd68e29066831'
            'd0b8405f1346b551a44f634c98629d7197d674aed808ed15e59aa25548e13e6e'
            '75f4aaba89db3a8d27e31a738ac667d4b698bb5be3558e53b5873dd7b366bca7'
            'b8cc697baa25851003bf2942475e07708d1e321925c830d5f8c5eafcd3a8bec6'
            'a6d39749f344c47d1d7f3d9854a347aafa69db38bdf995bf8b4178028bf8579c'
            'f6200f5b851508ed233edb2e2c98d1bde28ca561a652331aa16680304e386882'
            '79fc8038dd1a85694fb46752c70da0113cd1b1e95239fc34a8d64f5c844c4bc5'
            '64bf45332f10d5ac643d1248e5665ff35f4d841533da4b292ff3abdd483ef5fe'
            '5522981d0d19d8e4ec9717a3d1ebf9ba16561c2d528071fe349eccaeec3bedce'
            '59e2509675b79e0db7f4e3437bc9c3d54d094dce8c9acbf3916523a4d9957c89'
            'f90e7c7773db102e86571ee930b0c6b06998d4586ac9d45e0f3aff58ef8fcfe1'
            '748e9308ee36dac253e5b1d680c89908515d1f14ed7d49dc9126dfb46501d4a1'
            '311985dc6a5b6ec5d2e2ac08693a00165d6eeec91c5aeca798d2d5d2b09d59f9'
            'b957f8e7a9afddfab5226ac58242628134ccf110e0bca190ffaf3e5df3a70d44'
            'b58d109a7981309ce6ed87ed14692dda3ef19cfcca2fdb11f2d8f193dd5fc1b1'
            '186eabcc7649ea833fc8feb91c8935fa09b070b0a27fd46080a24bf62ee5b2e2'
            'b222518ecdd90f1b12785ef48dce5503814a70610b2d1a075f3e9a8e785afd2e'
            '5f11e45935063dc5da90f1c20f87bd83f98bac69b6e67c6d94c37e8d793a4d7a'
            '71d7eb059cefab7dccbfd618e8ffa21b908890b1085eed24d81d313e7735d38e'
            'b36322d3ebe872ea949d449701c1098ad9cba5115b1ebb52f88eef7bb934eeda'
            'e0ee83a409f9d8bf0e996435ce95bb292c229d3ce4c0288245889c1eaf3b40b3'
            'c820613fd26c8f23759a45150ac4c72cba157283db8c9a118cf308893c2c45d7'
            '5a17b565d97317d4a93109d0e5bedf3454d3b1eb2829dc76cef46b55dbcd884e'
            '29f1a6773e8fe66ffd66dc90460947190db2ddcf40ff82bb6b1ee354d0ec334b'
            '6b3c2ecfc5a87525f6dca30a59fc926988c48aa08bf5d5326cde12ccd1461fe6'
            'b45b41b84ececd6142f0645156a67ad25c49822cff7cc1f2e32a38a1ac437db6'
            '5d9fd924d305a04a5c9feb6e49577918a8e7fa91e5fa7aacbd5a89b4055fcdb6'
            '1442afa12a0223008f04dc754552ae07b55b9a588f8d9f67b8d10e4bdc87b7ea'
            '596a5092ec3417dfe5f82f638a23f6fbbb7c27f1f7698dd3f248a83cf8bef94f'
            '9bd6e459a4c689f44fa62ec1e1695a2a6bf23da49774a8d1e0c07cf7ae8dcef1'
            'b6e984481fadc167c8ddc74e5ee8a56cf62d81a11a0f45369a21eb46bdd605ed'
            '91d508a043b5c59026011416de669621424b74307bbf706835d4a584111bc0ca'
            'd4b588fc640dab9450f05796caf6d3f4bd5b605fbdd9b2c778b1ba398d6836a2'
            '15e62f345cec2573b2ba5c36f8a070ec208e501ae3222f82b8a181375ecda7d3'
            '85cf140eae54718ad0374abeb651a3b2f895fae386ed516f2e0ab96e3f3e0e26'
            'e8de9513ac16c23639b26b54ef249ac336ff734ed8bee8acd333382407cfebbe'
            '960b782cebbf40f611a839a1de4668f41ec178bda4490523b61a81e46cc271f7'
            'a143cfb61fb60463cb67fe426c5acd72c578990795035da81e960d5dd781eaef'
            'ef74eda2485f9927c7ef7c987039de1eb85220fc94f9a35e26d32f2b29e6ecb1'
            'fc67742814ca9f73213747f771d48a8f0ccd7ba9145ec8c77d62992d6b9e7e12'
            '47a649209a3897d16f88548b1583cb24e6ef0cbdf71c2efc6e18414243e1c107'
            '693409d09b560d4a54b7527fdbfbbf0b9b5181d9809dc99b14222927a68a40b1'
            '89fb9eace3d6caf359b29bd00d55cbd65611cdb2f599830e800c328c034b2ea5'
            'c8bcc5449b15942c9524fbaf6b9e1334b2abb293a7a0ad95f7d9ed1d35412a3d'
            '377734573fb0225cb5bb8b7fe5b78124e2017af17ed612d85e3aca78eabfacc6'
            '8e66264118cd09aa59adfa4658ca869a69ade199383c7a6540f1cbc2db91b200'
            '28f2048d74eb6dc092b00cc6d30aad6f1f3a21b204e036313a7dc4160e551d8d'
            '96ac0144d463c20a437b277cfb1ecc95104405ad143e0e0834507a82ab7da5da'
            'd8c9d080c8a09607008a54e09b836af24f065b4ffcf6ecc3e1c8bfb795b5b7cd'
            '704a91377d89e576a2038c92520e656e302f93ba71eadc3891290ef160b9f274'
            'a70c7a624f7b7a1b4a30dec606f01b8aeeb8c7d1b07782be1345ad427862b29d'
            '59265b9d5737897ec376986e17a79e12d00180c1dfab5ab45e689693dab4c9aa'
            '668b6f02b851cdc98acc84693b2e5aa75ea981c6c8d2c7d53f73a8ae42bb3046'
            '784bc01218ca7abe5a32f1f95745697266ff6d5b675c95fd475b5a65ce3f3fe5'
            'c872049bf3cb2f5f5b96a3139733ee524cab6e8fd7f7ee6ba4684eef5257df14')
