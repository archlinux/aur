# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: wido <widowild[AT]myopera[DOT]com>

pkgname=opera-i18n
pkgver=12.10
_pkgver=1210
pkgrel=1
_languages=af,ar,az,be,bg,bn,cs,da,de,el,en,en-GB,es-ES,es-LA,et,fa,fi,fr,fr-CA,fy,gd,he,hi,hr,hu,id,it,ja,ka,kk,ko,lt,lv,mk,ms,me,nb,nl,nn,pa,pl,pt,pt-BR,ro,ru,sk,sr,sv,sw,ta,te,th,tl,tr,uk,ur,uz,vi,zh-tw,zh-cn,zu
pkgdesc="Language packs for Opera"
arch=('any')
license=('custom:opera')
url="http://www.opera.com/"
depends=("opera")
eval source=("http://www.opera.com/download/lng/${_pkgver}/ouw${_pkgver}_{${_languages}}.lng")

package() {
  cd "${srcdir}"
  for lang in $(echo "${_languages}" | sed 's|,| |g'); do
    install -D -m 644 ouw${_pkgver}_${lang}.lng "${pkgdir}/usr/share/opera/locale/${lang}/ouw${_pkgver}_${lang}.lng"
  done
}

sha256sums=('62cd10fa037257b264a15a3e4d7c7fd968c14e44f1573e1c28f32af24d8d1cf8'
            'fef8e709a9b35b2b9790de5c02387df53253a040855d62d8e4359e82669dae2e'
            'f14798c6b97a9c4be3e06333cf5a0abf4000b26656e89fd8c9bd691b71f6aa7e'
            'a40b9a0667064e8083a157d21c65bf9b04c50f5024be4091826dc9b3d4d001af'
            '0ff5c337e45553b318d48814e2accb41b0b4c9857ac5f4e6ca6b39e6b0b50a88'
            'f57bed70fc0d798c3ce5538aa8aba505ec6967eaee41e1124bbffb49dbc1116e'
            '722217160f058a30d6a1ef22362108f4a1430a8627c4087cb4f6d47e3cebec86'
            'fdbdb27a378989f3e35006e03877edb7be8a6cf8db89d8c24e906eba435129e6'
            '3c563fe80658ac910c8a1f643c068efdf931afcc2759f1aa0d5fa18c0932e5c9'
            'a9e43151130bce355a6b487c68030b6a14c51393b6e67feb0488a3285e91e6ee'
            'dd0cc8bfa28ebc07f62f1c131fbfd5374cbf8368d94ec6726cfeb27eddd32358'
            '2f3627656f63d02d72cc6b2a0f52a7b9aba1f06d61e3b5f8b0ec2ba2ba2181a0'
            '00a513a39d44e9f5e05b733e57417f3f751300fdf96fbd33f589afd7e077d407'
            'a8f88c84caa2bca4738e69897c03840ff509a5aba71af885a907a0a91d518618'
            'fd2c3e13fea354b7fe8bc50a14a473180547c2eb34c5bb13a26778c421bbcca1'
            '40e981f12feb00366019738dad9d5e6f5a6b00371351b550ee89ee93a76b721c'
            'ee1e99b9e381a5b946e888f7227678aa2399823a00b4cd0f89bdec13f8506c75'
            '687011aa45b5d48d2289772bd75978d1b0f26447e283a839f1949f132bf9b418'
            'e632ae606bb408b37700da9c4c47d33c3af796f3b71970375e034a2ce4791b97'
            'bc3461b026eb41263c7e044f3571c82244c6ac942d85e7da8d7c0eea8e84959e'
            '6ff3ae51c4cda4347c5d458e80252e3c4b0e95a51d2b8683b570c3b3b090e445'
            'f534cc44f344c955c8d348cb2eca03794e1af815be1d346424a6820cc1b11863'
            '9bb65b698d10dfb744314e325a718c3a28f1598d79bf2a724260ecff0a2de903'
            '80ffafa25a459e8ca899017e611f64a989c4ab3aa2e3b291ea562f2242502b3e'
            'd84fc2f9d610d227c8b0a5ad2f67d41ff7798d6286df6a362f38f1a5a4a139f3'
            '9c5eda29407227db572fe7facca9764e4b8edac5450d8d03c7efd43c92e95adb'
            '2721ab76e0c52301f2dec8fa533fed3a2efa070a6aa51567f6b96f7c8fb9bd1f'
            '4eb6e5ce9f8c946ac23e8222b5310df5a6463d939144ff5386f2452456439b43'
            '3927d000791d403f233116f6aa0525ee3eaa2065b5d0fc7f8e0e3afd38e22439'
            'e5dd833db306f9a6fca665c153dcd2af6c53bc717f928cb6025d97e14b8862a9'
            'aebfc716fa15b54738a3b5be925d4a3cdc46cf1ff818474923ac3f0b192e3229'
            'dfa016729b48e02128bc1805ee02847fb55156d9ee820f0c2e8708cd52c9f38a'
            'c76bf65b98c9ef8895f0f55686d65b6ec312c68c5e3cea965ed9d15fd5de50b7'
            '2026491fac08a618768a77bbb1ddd90ca7299a789d86f67c2f5009d226d06a7d'
            'bbf23d7e2b3b535e97d151509db5a0866a1d817a821c73a6e9c25fde798c3c7e'
            'b3a28b2638d885a2d7a6dd5d4ccf9c0603785d4ce126f42302c418b939a9f9ad'
            'f9cc1cb1b231b21317eac59ca005488b9d6cb47c4cbfe82880996fb03629fb14'
            'a0bd3a5fb251bdd789ce0a90f440bfa7429ab7f713a5c699b6b48d3d4a77d2d3'
            '483e7f8634e66e1bc02675c368c716a91539630ec478d6d7125372cbda2fa4d1'
            '072794b672d318ef756e771533bd04c21cf784055ee7df261914fdc8c83c4f9b'
            '54308a79617e693b7d62763909510cd94764eaa526f815671ccb9b61faedd4dc'
            '9ff6d89d38e61f64b4344437de4537b73c848cf8f47808664ddb5b11501899d8'
            '0b3028b4f14fe576fe526439754607d719427e24d4043935f1dcf2cc7011a25e'
            'afe637464d689517f32b592e0d74eb9fd9652d0ca09c550f00021872541cf595'
            'e1bda84d676dd55a65efe3e36889c034df125dba9f06eac4865c59c24ae1ad2f'
            '6065f822f3746e94fc24a4b60fc5da4db4b3d333b4c5d6b3b82f94dc76821f29'
            'fd9432bf7ce3065152fe14d8a31bead6d30734e26bc83c2ed84350fb8a4c93f1'
            '5dd1e1630770b58ef6a2a13b75508765d30e324ad82fcf496574cbe6d85482cc'
            '7e5b4def9cf529ba8e27422d01106c2ceca2806464d423f3266c34a53f1120f4'
            '91cb78d62a5bfa6d31c9546ec587b4f4923e2679920d3f9ba719ed80e7e40e14'
            'dd4c4251b6ac4b4f517593a364582c1af319271b2994adda29f7eee25ad61ad3'
            '1ae9d8b8e70188226578d5b7bc8277992a05a25cd54766d2b94d104a8c9649ae'
            '6d223c95eb2e477557e8a3afb9b9ad68d2f09f9f2495049e491a5c9fa1723058'
            '545747162c2ba528800fe579c6d95930eee07e67d820aa2097bd834a2c604d9d'
            'a3cef325260c031d960fff97d7103ac91c4f11d49ecb5bf232ec6b0002b47c87'
            'e1332fa39eb3c5454d784b01b2d0d34b4fd5ebaf02fa8feda41b3cc1c3de70f2'
            'd490d9250f177a62835ad548d80c7f618b5145a02b2c55416709523373d0541a'
            '703343b3096a9d5b4b524d4d2baa8b986739706c8c816a32e699567cfb6ede51'
            'fc0e7778cada8ce24805dca8e486881d012ef01ad9c1fa3ce201fa962143dbfd'
            'ebc53face49be5e0d966354a1d891cbdcc17be025b26b8e378bd4b24addfc3f7'
            '10aabd4e2e188b0459b3a696fbab070448ac69329a315f644b12d031366588ee')
