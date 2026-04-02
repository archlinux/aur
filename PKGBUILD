pkgname=ircam-tifinagh-fonts
pkgver=20210525
pkgrel=1
pkgdesc='IRCAM Tifinagh fonts'
arch=('any')
url='http://www.ircam.ma/fr/alphabet-tifinaghe'
license=('custom')
makedepends=('libarchive')
options=('!strip')

# Upstream HTTPS has a broken certificate chain as of 2026-04-02.
DLAGENTS=('https::/usr/bin/curl -k -qgLf --retry 3 --retry-delay 3 -o %o %u')

_upstream_root='https://www.ircam.ma/sites/default/files/sites/default/files/polices_tifinaghes'
_archives=(
  'Abaqtich.zip'
  'Adar.zip'
  'Adlis.zip'
  'Adlis2-Bold.zip'
  'Adlis2.zip'
  'Afrag.zip'
  'Afraw.zip'
  'Afrdis.zip'
  'Afulki.zip'
  'Agoug.zip'
  'Agraghlan.zip'
  'Agrawlan.zip'
  'Amanar.zip'
  'Amawas.zip'
  'Amkkuz.zip'
  'Amnnagh.zip'
  'Amnzu.zip'
  'Amsdag.zip'
  'Amtroy.zip'
  'Amurar.zip'
  'Anafaw.zip'
  'Anafaw2.zip'
  'Anagray.zip'
  'Anamyar.zip'
  'Anaruz.zip'
  'Anaruz_sin.zip'
  'Anaviz.zip'
  'Anbraz.zip'
  'Aqurar.zip'
  'Asdar.zip'
  'Asfragh.zip'
  'Azmnzunuzor.zip'
  'Azurar.zip'
  'Azurar2.zip'
  'Cactus.zip'
  'Caligraphie.zip'
  'Callircam.zip'
  'Coupure.zip'
  'Ferforger.zip'
  'Font_A.zip'
  'Font_B.zip'
  'Goute.zip'
  'Gutik.zip'
  'Inknign.zip'
  'Izriri.zip'
  'Maghribi.zip'
  'Pointu.zip'
  'Tabarawat.zip'
  'Tadlagt1.zip'
  'Tadlagt2.zip'
  'Tadlagt3.zip'
  'Tagur_Bold.zip'
  'Taguri.zip'
  'Taguri_sin.zip'
  'Taguri_sin_bold.zip'
  'Tamalut_standard.zip'
  'Tamghra.zip'
  'TamzwartStandardUNICODE.zip'
  'Tanumi.zip'
  'TassafoutStandardUNICODE.zip'
  'TazdaytStandardUNICODE.zip'
  'TeddusStandardUNICODE.zip'
  'Tedrfi.zip'
  'Tidfi.zip'
  'Tifilit.zip'
  'TifinaghBD1.zip'
  'TifinaghBD2.zip'
  'TifinaghEcran1-Bold.zip'
  'TifinaghEcran1.zip'
  'TifinaghEcran2-Bold.zip'
  'TifinaghEcran2.zip'
  'TifinaghRevue1.zip'
  'TifinaghRevue1_Bold.zip'
  'TifinaghRevue2.zip'
  'TifinaghRevue2_Bold.zip'
  'Tifinaghe_Ircam_Unicode.zip'
  'Tinmlt.zip'
  'Tinmlt_sin.zip'
  'Tinparis.zip'
  'Tintflatin.zip'
  'Totem.zip'
)

source=('LICENSE')
sha256sums=('efd9aeb876d68491e5a53377b347fae6f0da3f22325a0f9d879bf30474bfe545'
            '050cc25da798c75508ed1731e6242d461f39d748708b0ac6160106ae0b7d68a3'
            '77a91dd4c0e52a14b759a061a2a484b16462efdd0cdc7514461d9ad342a1d2c2'
            'd6447250e2a818cc97f47917bac9b8f262e6ba7abe655056019282afc06131b5'
            '16e0914e8aabab5850a8b17cbeb3ac5d7e5d28b60b883acd18a3e8eadc2a4fe7'
            'fca65c4bc94b2d0d78d13019e45964acf7fc548f6ed25082ed0ed840ac33954c'
            '2abe1dba339deea1f505f8b93d6808a12b273fe2d800656ba6f974edfae876aa'
            'f17aa88deb0df8771c426db397effb3168dc10e0eb8be1a50ee9dc8d28cbf357'
            'e04236f96d203a7fcca2d56fb895ea3475c8818fc5481e230983553de8b62ced'
            '962026cb6366ea468d2e2bb0e9f53a40d0d807b4b766758a101602202d4c34b9'
            '38f4d4dbfceae913f09926b77cbdaa74deffe8b6f8cd2986868888bc19563400'
            'da661995f99329f6fc832357bded5413d72a4ea7c8e56dec691c696ea1a25e39'
            '1254f2904cddd9ae4b1bda729e53abd32685f19ae7f7710e9c37684d5a761c44'
            'ce651e88ebf5e0f2046c3f8cacf5d4e1828d6ae2589b1372d911ba29a4c63b1a'
            '830236b0debe6368830299bb698bba6fee65696f13937e069e69da5dce577196'
            '60e735283e58fac24e91f042721bbe127a4534a6352f485c488564d098cc47f7'
            '98aae39b4bfbc9295ab73c0acf7276dabfe34d5308103b6bbb89c3c51e4aedb3'
            '5f28eb7925b468d8cc372a5930f6c657ddadc59b9a5a35d3ecd6f399a0107cd4'
            'c373d1e1324ed442d4b773820bf239d5dd9a5dd1c3ad61d23a25ac4633eee201'
            '3e77a4122de7ad7c6cc26449f6965b3acc338e4b43a4dde8486a8733a2b96e55'
            'f3b276e537131e9a854b90819cdbc320ca455388a89ef8abdda7ab7b73ec5032'
            'dcbac0206f17dbea67f8346b56bd402fd837b51cfff56c41294f1126624f4eec'
            '6673cbc3370c37374027feb7035e13f209402e61d1c1a5664a277d3e0e8a484c'
            '4998ddc835caf8ccba97c3e3ff34da4a2189720c0b4956bc2c1fb3c97ea62cb7'
            'de92245deff541bd3eab4718e0df451406d3f564be1cf898f66a541c19cc886e'
            '19e108a14485e008be4f83873c0c6f6871ca1372f567843226f87cbe5d9e1551'
            'a2c80df0b5dbab3934e88bfac18f9faa9c9707d82a995254d4393e333118542f'
            '3ab77598053a4275ab67c6998cdd2dd7a031e4610a9d32a1dda20a4497c89b22'
            '320cc503823a36e6ed6f4edf91a006e6d6a6ead5466bcc80283aa236a9db743e'
            '430efa5a7993c7cf7c16aa1d147cd615325b52525b8113015f817394868f7b8f'
            '11b7ab25e6642b282d4134782bc95bd7c3f04c3825c0ef76eb46619475b094f0'
            'efc0c79dfdf675d97e80242f7ace937172b095b37e7d9ff0c4d02e671fa610a5'
            '3771ae36f8a9b87cfb4e3e62cd586e6c00891d1ef47c9c925cb416768faca3ac'
            'acc2004421d342fdaa862579a94d6d77f1e21658e6202ee6886c300e350d2814'
            '52c130b1c37184dba30cb63ceea09c1856a365524e219a7170cffeb3a519d495'
            '0f2f9c53e08e7251aded30052f5ce7715b246a07cb08d750a28c36186fcaabb8'
            '2bd0c2c6c404d5dcefe0370ccad5dc049e07239ae067625d8e5ee75c31937210'
            '48756f2420d5e91417754c8bf2a83086316fed6f8cba6791f6d0117361d9a1b2'
            '5c5553e8de6ce25cf76899d6ac1eca2286dbc46cb8f27f96d3fb74ba9e0b25bd'
            '9e8868c7a67a989c9b0546eeda4de66fe9a5fee8f8d92ddcfbf2921a97121900'
            '0b9ec1718b24ee8f9b70d09d0b56e86f9f0ae761c9de41b944f97ea199abe30f'
            'bb99a9f54e0de85216f48b3f64e5e3f8ada37fe9da97040a27b427da70b2251c'
            '1688e73a7e10d3bcf422bcd5c4abe3921f4e85e44792cc86b2ea0e5c5d07a54c'
            'f3370522a8a735547d4bc5ef4c10d860d4c9b8742a29245545ca0ade029a863c'
            '22418230b04eaec706d3a94a435fafba2c6ba53aebf762936566ac64a15fb01f'
            '5c1c9f55729d8f83b34514820dc6fff9ffbc34eaae76af4a7f335369a5cdf66d'
            '6a731f01dec2f34cecce1404639624bebc67da51285575e135eb0511f4a64f49'
            'aa767c553ad8a9f63d72abdb039e3e24dbade037955857ad2e19e0e4534c24cd'
            '67857ad28dd37e442fe3b5156aa3f401178f9a792b0e0e0f2023b8a225b45e70'
            '70f96e28a7a3686e2b0e8e1a51b46f59e3addbd9ef7e6bbdefa2e857bd60733d'
            '74bf512b42ea8b20613aeebcf5e81982777c9ac1385b97d038951eb12619d8d3'
            'c31dee0aa8cadc000bc5d4c8817ae1528242261774c56dd008aec4431d3bbc87'
            'e2afa382fc84dbd56fc9d8fe487626e4317bc547a8779c6ca1a077da079e1e75'
            'f3214b3afafcd30ecdc727369f298e520738762cc7c93d615a20411c26add896'
            'f29b6c3c2cf62c418066d01e3eae168cc88da199aaeea8e7e1c6f0f3da7a72df'
            'a455ecdcc78c31ad189c2ded84fd0b96dda8d5d37c1319b920976d787ce8261c'
            'a41226aa5982c513064fa81345aba48afb75391225e988d2797d87b998bece89'
            '29586d425d9c30e53848c9bd306d3b85324f11bb10c5510e39468bbd4dad58ba'
            '8f471050521102265835489c0728ada467b1aa93d98f043160a8173656cb2df0'
            'a2790e811d90fac4707a815417d1bf0f4e01b533b3268d4f366c942ec6649ed5'
            'ce79564e1db955a2d0aa8e7d5f3224311310fed93cbfc34b724bd1c228438f39'
            '44e992368fe9f7acb86093702b4f528fa47380e47ba1d5dcf2043af41ccb36d1'
            '70b5e1e931d8a8bced72fd550f867026f6885f71c01f0244f5816e76b013680e'
            '31493425f13582a8afd41eb853c66de485344bf2f82d84682361e524a95b669a'
            '243b3062b64391e6916b5c97bece250d098f29b2eb8a602e9ea633c840bebcb3'
            '58dddb597aca85f06c6459ac20114c8eb2bbebc5f13122abcdcc2941bf55250f'
            '1dfd822a7ef78c8553d44888db6713e99ca007fd9024b16dc4813b093f75743a'
            '80bc480d1ff6e2f3f352e10d13534e801e57a7e1ce103af4768a63fe7f21b953'
            '94a178ee3061e886ad4daa3f69b32708c03b9da65aab712968af2593d2533943'
            'ca2cce7f2eaaefa2353602196fa6949c250b7f5d040cc70d434af827303ce645'
            'e38ff00137f8a8cb8be275534eb1af50c89bfde72ffaff034ea2ef2f28f19254'
            '39f51a8e8be7535d663721c8d2d7f11f89f47d509caac941b94b8009fe3e2e81'
            '39bb3369b82b144a10038b4b15290983da929b9671942280386328f0ac69cbc7'
            'e2782c278852986135b919c90f399ad647e95c7e0da878de9eb53eca4816f4c7'
            'd6ae1e28098583609296fba82b059883da27114adbcf305f3adc6f2b0638695a'
            'f55f20265ac239d8c009b6cfb08a69a5385805ab29a98a52d65b366a46844b41'
            '69d6ceeb70415a6a1454f31145d69f8790dfb87960f4de03f4a2709323a86210'
            '2bc62715bd8499622741ea3997048262d9eae9acd20a64585ebf8ff7826f7f42'
            '78b0fdacef51c1910f6d1c8775946d91564664132f1ab0595f395717bcdb0f9b'
            '0aac1c03fe3f41e3a911ef3adf451bdf456afdf585bf9b86385a0e123e47629a'
            'b7b6452eb9618c016fa15e22ec41312d72a00b3f6dc922cb6e1a93b2939c27c7'
            'a655a9e2fbd4bae02f67393f0b296fa78c23dd1e58a64eb435a32c7c0e61e03f')
for _archive in "${_archives[@]}"; do
  source+=("${_archive}::${_upstream_root}/${_archive}")
done
unset _archive

noextract=("${_archives[@]}")

package() {
  install -dm755 "$pkgdir/usr/share/fonts/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local archive extract_dir font_path
  for archive in "${_archives[@]}"; do
    extract_dir="$srcdir/${archive%.zip}"
    rm -rf "$extract_dir"
    install -dm755 "$extract_dir"
    bsdtar --no-same-owner -xf "$srcdir/$archive" -C "$extract_dir"

    font_path=$(find "$extract_dir" -type f -iname '*.otf' | LC_ALL=C sort | head -n1)
    if [[ -z $font_path ]]; then
      font_path=$(find "$extract_dir" -type f -iname '*.ttf' | LC_ALL=C sort | head -n1)
    fi

    if [[ -z $font_path ]]; then
      echo "No installable font found in $archive" >&2
      return 1
    fi

    install -Dm644 "$font_path" "$pkgdir/usr/share/fonts/$pkgname/$(basename "$font_path")"
  done
}
