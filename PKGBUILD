# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=opera-i18n
pkgver=11.62
_pkgver=1162
pkgrel=1
_languages=af,az,be,bg,bn,cs,da,de,el,en,en-GB,es-ES,es-LA,et,fi,fr,fr-CA,fy,gd,hi,hr,hu,id,it,ja,ka,ko,lt,mk,ms,me,nb,nl,nn,pa,pl,pt,pt-BR,ro,ru,sk,sr,sv,sw,ta,te,th,tl,tr,uk,uz,vi,zh-tw,zh-cn,zu
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

sha256sums=('ad058a5567bf87df003ebb9f0356b13783d271bf76a3b35d73a62f20569c5a74'
            'd673ab6d4d48ed918588b7a1d66f2c97a78ccaec45b5a0dcea181b3a9b682bd4'
            '85cc8c2f399087d479c3fbd6bee38ac69142224b0d84f22edde9baad6e97be65'
            '5f2b54733819ed3549bfcf998890010bc4b338d06330d263be489aaac08ae8bc'
            'df60800e6c886339176071bc01f2db632c17d6ea54f3346c05fa76e0080b08fb'
            'a0e84665a332835b7828e1bced68364113f2eba4fbb371a3174e2b7e7e454d73'
            '173acaca9fc44f98266338f861420070bfb4db60c9976e7b1f244ffd3e68bd0b'
            'bd1c9b86f629d81118407470c9075609a42fc9f4d8b81f7e3a638c1b1c272030'
            '97989895f9f8932a97b060f42397a2ea0d0ddee6d09e4920894da4f57be2239a'
            '9d5fc2bcd1887ca077caf25c623b7df85ff28e2871b4a10fec96263789e22386'
            'bd9fc8c9e6b0e7caede21bb2cf693c31d59f6a01dd2f9dc1d989222862dcd801'
            '66652d848f261761279d3b740c636e211bcf4f06b242ecbe8a5495b6cf6905ae'
            '53debcdf38988a29ec8673d28d029713124758d278e65f9dce16f4cf3376b826'
            '9ec8679a8c6f84787c18852e0f8121e364ffcac95a422a40c75f7af33723dbe8'
            '5fb34641b27d4621601664574e924f20f5e2f482223da262c548e22af95199fc'
            'fef8e6275c56663226659d7391883a786a7ce1563d13a72e83ce59deccab775f'
            'f222d8c8e6977deb7eb20e55a54c7dfe973aa9611e919f64b2cc1312fc59c71b'
            '25d92240b22cc1ff4741170b533931bf0fa9aaa78b33801c841fc2577f9feaf2'
            '2c9359ce99019f42a952a4c267143318b1aeda1561cc04383d2f9a5a5b11ec85'
            'b5d1262acce5f2ddd8d4fec04866845e8cff99fe021d33af02863c75a0880674'
            'e714cb0dfa8461336cd174f8f80f35c45cbfb5a56dd374b9d67eb32c2688eb0d'
            'c82541a0d9969e8864b2f9260bb5567023bbd2b6cf3ed490521e2385b1c7cb65'
            '97b73e25921bf449c2f4fd41176ab8302c59c219c379b2a9397676e49fc4a593'
            'ad988a455bf3ae54235fff29121e3566f408bc94b5888d39182343968eb10a90'
            '47dc843587fd646a661ee335ee663cb37eba7ef5ac6f63e9660fad64930f8f13'
            '90da0ad0c2ace0e7a6b7024deec4c12c1fa971d86d9ed47e0e7ea19e274c9e4f'
            '012536869ac5913c02dbbc1eb33ea2780b3ed5a5c0035a506f538baa8ac8a8d1'
            '76f41ca6df65dbf1740428c8f5c5a0ed51829095621866ac3c6d89a753bb4a5f'
            '08ba6ec0e592b71606d71c30752a18f9a7c6dca554d57a868eb600ba024ed4ae'
            'e946ec92d3bd937b8caabf16a74145817291c5704750284948f6c23e20e44a6e'
            '62b3951ba20897404cd8fd03e45853fc4643dbe6519dc5b6c694b2c92289d425'
            'ec2584e4902a89c77f6424c81061465bac52ce91af1b6db02e4e8e98347c972c'
            'f50a13131e4c9ec2d153b2051413164e4e7135d63c05d7cc3ea99ae3cea90aea'
            '2555225bcf65a24a9ff8580fac088bd4354835f5b2075cd560913387e1df5c45'
            'd0acc644af9118395f0285ba5eb23a63286733fa73d3f06c2591aec75a63c945'
            'a3b7bf349b393fce8897bb86cc6470035be2c74eedd202dfe7bdaebea0dfd48e'
            '9c6d11c06e801de13c4495265d441bef12bc7e6291aaacfee0c759ed33dbc4d7'
            '0c18a78bcbb8b8581dd7173c58c304ee2131981d2a6e97013e90819684d7f0d7'
            '71f43669eee8978e46525276530080285f536776c75f03059b992ba7ad8b8775'
            'fae0abf7282e5b0e3c16aca5b62d3e0a11b537646bd7878f3ebe46b2fcb3be37'
            '997d29a6de077bbb07d04088ca4f7675acbe7302a6d167ecbff684c00e8e0b47'
            '49824ea66e2ae077c5805c9eb612ec8b9d4fb8e8a006297b22c7bd1b9a7ed876'
            '653777e034852b2fc47b5ac0a5713929864169c3240fcb681067c4ed61e48417'
            '3b59eda37a68eef79965f9d2c1732ce810bc488fe9c204a0e2e15ab61fd11da6'
            'cb09306d6b057dcc34def80abd9395d4cfb530cc1d309a1ca0e2512275ea31a6'
            'a2958fca19c15cde4cf93fed4cdd784f47aee6fe3359854ea45e6df10d581885'
            'e4d3fa5d485e80836acb73cbb1406ebf8a1fe138f4cd20a7c3531082013b020d'
            '10be2d5099024dc03634c6fa76686e08c65b472a7c682fd023ba7b86190d0044'
            'b2c231b30360937146156d5d6f20c8da561c59b07b7444eb050189576fb0730b'
            '2ab7c6e1d778f946bbe4ed49dda16f2fc0460fb4353821faf4a726441c074fc9'
            '0f49f4639ffa004f718b42c31103659aff0344ddfbdd4c21a843db845bd46a11'
            'cb0fd9431a78f12ce0dddcd5671f3b92c9249c68e7e0a4e5c1ded2139fc16a38'
            '118a45f2be54839f1a0e9c13f7aefc65ffb5400dd45c9c8ea19ee441a71fb5d6'
            '0258dcee8dd6fc4f0147914041147cb83aa6dd80aa73bb0bd7b84766fb6c7832'
            '1ffe18e6e6df6436376cc5373c51837d527471e43ac360925f7baf12a6cdddea')
