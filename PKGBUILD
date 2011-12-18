# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=opera-i18n
pkgver=11.60
_pkgver=1160
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

sha256sums=('74a4f74a149cf27ff5aed5d1fd7a4d73743a4cb7a386b7943acf6f291c4023e7'
            '6fc4d8ff1642bda0cd46c337fe03d46e2c824852270490daa7f6160dfe78d971'
            '6dcca2231316cdaf86161087b1d16e5d28e92e40ea2a98901403b7fb6497d864'
            '09a592db7da954b91dd9a2c11f1c6e0c30dacca9758d75ed7e47ec6fe22f99f6'
            '7a0dd0cf85696613c63825574811410157c55479d4e3ec6a76e00ce6c873f1a8'
            '7af36aaacbf39fb67e23f409e0b37334cd9824a3086509689a68f7df21cd1629'
            '24b4d5e56c12f8341386f5798a6bde666c1684ce6b177788167eb1de42030866'
            '84c4aa406c865bfe7906139dc1c71436de58266146db98a6dfa79996c2f6a7c0'
            '5bbb9422d33222fc90380b9727e107a5702be7057c92bb5e16d8e34976a79300'
            '66b31f2b615136aa5fda3817a337d1df35ac78f19897527409196a845006661e'
            '54dd89f2082e1ad5b159f1aaa44a013ce3cb4fbec5045a3d16ca679fe8ba4849'
            '93dfcf772cdc88bb557a49da88d8ea2a5ec5d6bd18c5df8634a2519111251335'
            '0052c8261a704f2bf350a47f9cef9c6008c620db7858383175ef6d0da8be4669'
            'a227bf7aa76125010ba8d9064a8890bd74be89b51cbf1fb0855772a9195d5b59'
            'cb94d75b2e04222d823e730ef524f606c6f871974a3bfbf0ec8b25bf17c907d1'
            'bfe8757004b201c1f95faa30c36f7f2d03948dbcb35c302363ae9853f978419e'
            '190c8fe2215e154b87b4d14c78321f5bc27178336fa12ce4098c0761859281ee'
            '598de3e3659ecc9ce7f31410dfdfad85e6f537b31b7f60ebb1812a76a589f447'
            '49795d9d97a5b8cf5531db5fccc69189a34fa6d51005bc31035e5691621c3726'
            '4dbc1cb2aec8bb661352a22b6827746e9fed2613358ba7733ae874493cf38941'
            'a3203498898c48b2ce3ae383cbf9f1bd49b79bbd8fbcb19d0e138d19a5d26db9'
            '8d9c3f44df0c9d7eac82c68cb83e766f10716fb19808132bbc29dc6798fbcc8a'
            'cf31ef42052def1254fb6488b2873e55fd9a8dce34754dda1703abf7e6cd4864'
            '3e2064c164d8efa62e6ee69c8e9a3fc33bbbf89c045a08cdf8a655a53312bafc'
            '67293823b3262ddb30c0d3373a01b12d8ff36ae75c66c58edf07786fa8a7aa0c'
            '65f61b13edb6974269061ab220ab31b71e72495f46dab695c307adbffc2ca88c'
            'edea8ec493cfe167c391f049a4ac684f861cc7a36104316911fd20221f6b0c72'
            'b4fe7d092749d58b0081f9280616b3c63091d70fb18c9dfeafb4cdbfd101b75a'
            '93a611f15efb9cb1d3cf1c475ed64fa7cafc23616d32ecc22d8d718ba154a29b'
            '9c022cc9f77dd9190416f55443bede1483bb86619c8c2b441e5b089782bc9998'
            '0952ff5913d9bd944320e7fe72c140310e1bcda71376f459f42c530e8fe8bb29'
            'c50047824a859ab1dcfd6307a270681b2e611433884ceb36ba78f075ddafb3f8'
            '624c6dc6f758e6894fbbe414c86f41a4d9c92b6638f1ff6183020e049c80ab24'
            'ad13cb998a0af1f04bf750ae586a9708af43400c8a05cd032720343d0e791653'
            '6453951cea9939234b45e28f97f02504a6e4a8a73c4af8f3e3b76cae68b65515'
            'd6879838c5fcf584b729a540c1d9fcbaf414db30150d7b83c0b341af028d1d75'
            'f1d21ae796897949826d2b0ccab75d59ee0a2977c9f5e1b32b426c2d7ac6a6f8'
            '268864a91a8fb7504552fd713d0715547b616eaa19f801ef00394aafaded3da2'
            'dcf35ccfde66970b5959df822376186eda96a65465ba4f05c8b6e1f45b474b38'
            '8f34b2dc0edea3bb84c79accf11df290ef3ccfbf79b5dcfb939eb8c35506a7f1'
            '4c09d15b6f22c181006f212036016c15993963afb6e070b6a1eef5939c908de2'
            '8428dbf988ef17ff20a1affc9a2c7f3a5914db40f906405da80beb463a580819'
            '744a6572efd8cfb37548e16e685124b942c1e30b1f03668a0bbb580019ecf69b'
            'd3809d6469da17a2050945cefc735c7083752b98f1729a26cc4c7dd931b98022'
            '7f795eb6c80cab19c1af9253001428ba20ac32c4c38038e8639845e09c2d2de8'
            '342a38853f745300f4c548dfbbc73490e423a90b56679fa8e7758146d5a1b1d4'
            'a6600eb921e701773dd0d5367628c0df08376fcda5650d841ff7bcf2db0d7cd4'
            '01966c3b0b8474d11b278f4125f3350b5264e10a4a8051712d72c2ff92cf928c'
            'a4ea3c5dbce44d4ab0430fe61889703920685f14a3344914c2e7d75988207377'
            'a8b58b5c6f50da0dd89e7e5428b1bdcd337245780e54339c672ebacedc723b33'
            '2af0f8f77bd7c86dfc8739e4d5eb35b397f61be2a0c15bb94173aa5d147c8536'
            'e951c39f9b7ba7f15b19681969f1a7ec4561cb6f24106763da90d189a89bda49'
            '0ab6073cd6da64810861f20da8f76ce769764ca86c54cc85c6deb6f8d8c06bc3'
            '141eb6899fced28ff8c2ac7fe1370ad02fb4925a613b87d866eb4c4910d88500'
            '569afa07ab22eb7d5497a14332b75c29580d021b24177025063c93afdc354e35')
