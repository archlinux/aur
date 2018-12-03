# $Id: PKGBUILD 277477 2016-10-01 03:36:40Z foutrelis $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=inox-hard
pk=snox
name=chromium
pkgver=70.0.3538.110
pkgrel=1
_launcher_ver=5
pkgdesc="A web browser built for speed, simplicity, and security"
arch=('i686' 'x86_64')
url="https://www.chromium.org/Home"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja' 'nodejs' 'git' 'ncurses5-compat-libs' 'gn-chromium')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
install=inox-hard.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/$name-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/inox.desktop
        https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/breakpad-use-ucontext_t.patch
        https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/crc32c-string-view-check.patch
        https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/chromium-gn-bootstrap-r17.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/001.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/002.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/004.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/005.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/006.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/007.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/008.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/009.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/010.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/011.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/012.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/013.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/014.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/015.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/016.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/2kb.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/018.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/k1.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/019.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/020.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/021.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/022.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/023.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/024.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/025.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/026.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/027.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/029.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/030.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/031.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/032.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/034.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/035.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/360.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/037.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/038.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/12.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/16.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/20.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/9k.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/048.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/gna.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/gnb.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/3992.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/2992.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/2ka.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/product_logo_{16,22,24,32,48,64,128,256}.png
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/2kc.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/2kd.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/2ke.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/2kf.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/2kg.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/2kh.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/2ki.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/na.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/nb.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/nc.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/nd.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/a.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/b.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/c.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/d.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/e.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/k.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/l.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/l2.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/l3.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/m.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/n.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/o.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/p.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/r21.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/bp.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/CP.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/888.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/narnia1.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/meme.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/p1.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/p2.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/e3.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/pt.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/edgy.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/k2.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/desu.patch
)


sha256sums=('cb4f2f3f5a3344f7c452b61f8086d4b4e56af6f5bc34309c3ede8be6b4ab81a3'
            '4dc3428f2c927955d9ae117f2fb24d098cc6dd67adb760ac9c82b522ec8b0587'
            '1a3a33e34764205c7be280c7436730f5d899bdbc44339ec5df208e09fd102883'
            '6e9a345f810d36068ee74ebba4708c70ab30421dad3571b6be5e9db635078ea8'
            '35435e8dae76737baafecdc76d74a1c97281c4179e416556e033a06a31468e6d'
            'd81319f168dad0e411c8e810f73daa2f56ff579578771bd9c9bb1aa2d7c09a8b'
            'ecd1cf05b2c41e608aaeda9ca4fe8d6c698c09455d73bba73c7efccac44cdbcb'
            '9072ce92080e4ff67beea3cc04aebd3f316c196195db350eb49ae3a88ac61c83'
            '6b13e3bf360d8dbd1f722ff0c2c98cf6020806a4cb1f9af64d6c7b6216452230'
            '0a6e050f5acbe9b90de88f3f7c3828bc190f5831ed582a8e49005fe999db306c'
            '5c8c3ad7d5b4ebda7508e3aee13349fc8ad627d7a7e3147168e214f03e433168'
            '885bd27063ebc43b7030e9d9d364a46a248c4744f66c466017b42a83a279e6ab'
            '8696919f69ef927f095944ae7ef869b283450a4b2cdd4efdebc51fc2b1e747e0'
            'b9899b26e65a6fc376bffd8cb685667b0ec1b04e90c8250f40c969bf4602c5a0'
            'fd5fdc83665113677951e2e713a4696d999a070d6b59bb57319df357b35d4fad'
            '3850ad42d0cb4ca011d46b9d569a0a2bf83476f0c3da70c74d4f011cec59f885'
            '7beb0f3bbc55960092347767d423415860a3867525f6d1bbb057b3d72fae0618'
            'bcaeeb52d5d17fa9e6d4883cdeef8150f7e6ce440e0fcd3cef17d99f4b5db672'
            'f6a4c02feb5b21f1814d0b835b94a8b6222628ff97800b5411dc86852bfa5883'
            'b5532de9e402a7d0b12258e9de56722e7eec84dc54cd53b9fe25d62c7354c0af'
            'f4af2787f31abe66ab1180affed6f4c97daaad9151de429c9f5dc3e223cc8d87'
            '3a451ca37ff6f47d8e8a84ecde8c24179a74991bfae4ff1a3ca94131ca0a11f4'
            '1632b2d3b9062e6ec8872b9df180f82a93099a50eda6f15125ffe56dd45beca6'
            'e6a3490da7b98e3c2d9d04bc595a3349779a0426dfe61aa955d6fb7daa816c12'
            '9be24cb424d59cea12944bdb451690728e373ece6e4e93dbae8b92078da2130d'
            'b35247d9ca4a7a40d9ca59e95ee9457245d903542e4c29033d200b6198396820'
            '7cde4208b87ba4632e2c83aa13163d3b34935d6175c868b671c74bb17b752fb5'
            '519965231b125f40a644829e50529befe496e02ca2e03ebc38d8791706bf2162'
            '442274439bf7d569edecbc1628b2a73fc0b3fa0901298037f613c1a68010e119'
            '66d0a7672b29293080baa141540bfdf584d3f013c6d2115fa2c9dfa28beee934'
            'd975a6abd6cb8ff2a2178d9a4755ea978033af522a0b4121d025703133a87ca2'
            'a392decc52fff5cd660f293b26739d7203f8678cc57d560f1b42efff1d43dc0d'
            '038571a1df00b5ec63a20b442a7e6a0b382b805f4bb91fff1ed8186a9cf8d066'
            'db1d9f62899a1acf917394d807f10765f3cbeef63c42f1e8359239b806f42517'
            '3d66b22f1ba6d7309eafd93e3b0a3d9ec841828f88cd8e267a7760585776dd5b'
            '0a148b0a15a63feb08ed79695a80d09ad39db7a3373b217cd499909218b94fda'
            'cabe339110369d08b2cef0b4308ee8eb8385054583815c3927421588ae94d9e7'
            '5a4ec61000266fd623e0a3377210ed324ed62eeba6c61ecd95ffb49d4d20640f'
            '4570a87cb632896818f8bf96eb38157bcbcfec55e702683e36d8bc63b16764af'
            '8aa6928dfeec97b5a2c2b22e1abda42fd0e57b6c480356c12ca4726a59f12fa8'
            '2acda9e5de0efa71c8347eb490bcae7993ae28dceaba406a0dafb50110539ba2'
            '1e9fc91a973977bdd03fddb65610f34e60a0fbd357033137dbb12f4657b14cf8'
            '6f0768e13f2218597f7c39f4398381934333ec302756147e488defa01cbb1c4c'
            '216829c72f1cc378bc66fb4f62f047cccd31684d946ba9a406b6e7a8f1351677'
            '80d2974001708c288a54c24e1dc896ef25916552b740765f6066a244c05ffcd5'
            'e69053b14c008ee8c20134a022726c09a81b03ef18dc1298d2d8fda88211568f'
            '814fa3b82c8330b944b138ece864be4761fe17f42061816028b5d8c1f2609c8a'
            '41fa66c8a12d3341010a58e1c78d005a10d3ac7527a88b7a8c005b35de58c0bb'
            '0ac16793634edde24c214eeffa9def755b9b76b256dfa3d9fd31de6002ff5dfa'
            'b80b351152d3415b5b7dbfaf07edd94bb8f7dd56eab4380c577b102c6b758c10'
            'c81a1414b48fb57e7089f3ceb1e85f34090348f4d6d8c7d1c138afd98a7663d4'
            '73a73b6551595c7bbe4eff6ab8cb5cd110cb62675c855370fc2121ec2e127be3'
            '71471fa4690894420f9e04a2e9a622af620d92ac2714a35f9a4c4e90fa3968dd'
            '4a533acefbbc1567b0d74a1c0903e9179b8c59c1beabe748850795815366e509'
            '7b88830c5e0e9819f514ad68aae885d427541a907e25607e47dee1b0f38975fd'
            '8c10e3b03b13555b461add586422472e0a96d3af49a078d6d952bc0719ba9d94'
            'cc08b771d83b7434c3173c27419bc7d1d4ee375256f3169ef2b9333ba1f2beeb'
            '53a1e8da18069eb4d6ab3af9c923c22a0f020241a4839c3140e3601052ddf6ff'
            '896993987d4ef9f0ac7db454f288117316c2c80ed0b6764019afd760db222dad'
            '3df9b3bbdc07fde63d9e400954dcc6ab6e0e5454f0ef6447570eef0549337354'
            '3fad36de0df6bf61047561ce18d5f08b66fb232aa3e80f82e4a0408a758f3f61'
            'f4122246d8d4898937de2f221248b8452fd3d24058b1d27005349e245c051e79'
            '96fed3b7de6ffceee1e89d8459acbc6c990ec828f60b93385fa414bfe1453819'
            '518edcadb1538bbcc3309039b9f7d7cff978f90ee9d547000a7e6821d5fa2d13'
            '776c4a7c55f406700714d427061556868d80ec786a2521a5e4660576b18c3d79'
            'cdc55ec692caffb02fba826308c6e39b0045674460098bda085237f2123798a0'
            '3c95bf62701f762b166e78c88e06752caf057a00fdaaae87de561fafc321b20b'
            '127747c5c692b0b0ef62f0e6ae79c894cd4798846bba53bf23b0b8bbe6974ba0'
            '065a69ca6547e89f84ded7b95e29a7fb3ac762eaac3aa940ab1ec5a3ecbe3a2f'
            '0526518bd42da73113a88a440739a50fb85fb0c1e8528b1a8340747d901e3f5b'
            'c367599e25bd9d408d52dd26ceec9f0048b0991cc74980c8c40d602e61a2a844'
            'b54a69d6eeb03bf56e5a6430cbc07fd8d12532709876d38828e4c455eca29e3b'
            'a466902d700c22178ba4f01f3a3ed94bb296ddde36396b70690513b6934a3dcc'
            '6130351d4c918e5b60f0ea4914e7e2f26fe4221ac97bcecacb4161fd2d23906c'
            'fb3abae54309adf69b98bd2435fbc23f17bc526dbf1d1e97907da87e7cf0aeed'
            'fb7c96ecf7f97fd6d356b8ca714efc518fc5bf40d92a23a5ff1ad8462d56b248'
            '359b7502b1930b643db9a6aec3e75c06c1f917dd774c7562ac256a519cbaa6d7'
            '38af0293f67513b2480047aebbd84fd5998ab3a20fb1af7a3f1e52b97dd27b20'
            '6d3251fb5aa200725a8cdc977d203ef98aaf8ed1564d0a4fa3b67c29a56520a9'
            'aaf6af367fcd478499f306cb1db44bbd4f58fadfc4b969046ec9fb47a2327db7'
            '51a336bee649d77a623b5da536c3b77b81ea67dbc9c1c34f9539c739d420379e'
            'a72bfdbea4e1bf9c273a78ef9c186968b1e7dd3e993a4a381488d8b9c9613552'
            '502b4eca6edf10fe1d036ab2c65363b4300de91b381ce687e08bd96dc254c898'
            '717d8d042c8c8e64d01c173090c52172fab4f09e8857e8510fbdd5f7361e0e5e'
            'eea10be17469d859f6731e056d9914e91e8049698012ba399d441846d218d68b'
            'a5327677d62f34da26e7aa714d49e71f7ebfcdbcb16b37dd8fe34fdf0d92c438'
            'e660590ebc900879d059ea0b8f9cfbf66f45d0d43f04f1b11ce2d0daf781f265'
            '84d61c7ccc1e99dd593970bfff1cbc030b586cc90531541d17323e6b92f15230'
            '4705552f63a28314f3225ebc0cf9d82993466397de2eee3dc9b2c4a085c63f7d'
            'e3cbf8c407974cee82541f0c2395059e90d513e050c05f23975465595c23f0c5'
            '1bb54bd32e78bddc68986a5ddb93eff29ac6cfe2744a499f52071fa3420591f0'
            '5c6845a62c845d8b506ad3704158b96fb7b3a2f59a7a6b9eb8f14781a79a86ac'
            '862a852fbe5d502ac35227c46ca54304f47e7400041dff806f10bd2d82f7b971'
            'cb2443816f181c50f4e72bca899d52ef1ecd14ec333d271e1e33223ceb6107e4'
            '042b36c27c788f80fcbb3d55059d22ce773a2eebf2b5e5bd7d7780d32c0a96da'
            'cd4c8fa8294f542a3fea1dd3df4a0a7370723f7139e5c59ec53f4ed639976d80'
            '11b66c829c124cf764a0e6971dc0cf67adea5058b5777355b85b2a0540f550d6'
            '191a5764a79f4c9cd99d8f50d27c00a59cdf4bc314e94eb02b3fc4bee0fd81a0')


# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -rgA _system_libs=(
  #[ffmpeg]=ffmpeg           # https://crbug.com/731766
  [flac]=flac
  #[freetype]=freetype2      # https://crbug.com/pdfium/733
  #[harfbuzz-ng]=harfbuzz-icu
  #[icu]=icu
  [libdrm]=
  [libjpeg]=libjpeg
  #[libpng]=libpng           # https://crbug.com/752403#c10
  #[libvpx]=libvpx           # https://bugs.gentoo.org/611394
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  #[zlib]=minizip
)
depends+=(${_system_libs[@]})

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.


prepare() {
  cd "$srcdir/$name-$pkgver"

  # https://crbug.com/710701
  local _chrome_build_hash=$(curl -s https://chromium.googlesource.com/chromium/src.git/+/$pkgver?format=TEXT |
    base64 -d | grep -Po '^parent \K[a-z0-9]{40}$')
  if [[ -z $_chrome_build_hash ]]; then
    error "Unable to fetch Chrome build hash."
    return 1
  fi
  echo "LASTCHANGE=$_chrome_build_hash-" >build/util/LASTCHANGE




patch -Np1 -i ../001.patch
patch -Np1 -i ../002.patch
patch -Np1 -i ../004.patch
patch -Np1 -i ../005.patch
patch -Np1 -i ../006.patch
patch -Np1 -i ../007.patch
patch -Np1 -i ../008.patch
patch -Np1 -i ../009.patch
patch -Np1 -i ../010.patch
patch -Np1 -i ../011.patch
patch -Np1 -i ../012.patch
patch -Np1 -i ../013.patch
patch -Np1 -i ../014.patch
patch -Np1 -i ../015.patch
patch -Np1 -i ../016.patch
patch -Np1 -i ../2kb.patch
patch -Np1 -i ../018.patch
patch -Np1 -i ../019.patch
patch -Np1 -i ../020.patch
patch -Np1 -i ../021.patch
patch -Np1 -i ../022.patch
patch -Np1 -i ../023.patch
patch -Np1 -i ../024.patch
patch -Np1 -i ../025.patch
patch -Np1 -i ../026.patch
patch -Np1 -i ../027.patch
patch -Np1 -i ../029.patch
patch -Np1 -i ../030.patch
patch -Np1 -i ../CP.patch
patch -Np1 -i ../032.patch
patch -Np1 -i ../034.patch
patch -Np1 -i ../035.patch
patch -Np1 -i ../360.patch
patch -Np1 -i ../888.patch
patch -Np1 -i ../meme.patch

patch -Np1 -i ../037.patch
patch -Np1 -i ../038.patch
patch -Np1 -i ../pt.patch


msg2 'Cut media router'
patch -Np1 -i ../3992.patch
patch -Np1 -i ../2992.patch
patch -Np1 -i ../2ka.patch



patch -Np1 -i ../2kc.patch
patch -Np1 -i ../2kd.patch
patch -Np1 -i ../2ke.patch
#patch -Np1 -i ../2kf.patch
patch -Np1 -i ../2kg.patch
patch -Np1 -i ../2kh.patch
patch -Np1 -i ../2ki.patch


patch -Np1 -i ../na.patch
patch -Np1 -i ../nb.patch
patch -Np1 -i ../nc.patch
patch -Np1 -i ../nd.patch



patch -Np1 -i ../a.patch
patch -Np1 -i ../b.patch
patch -Np1 -i ../c.patch
patch -Np1 -i ../d.patch
patch -Np1 -i ../k.patch
patch -Np1 -i ../l.patch
patch -Np1 -i ../l2.patch
patch -Np1 -i ../l3.patch
patch -Np1 -i ../m.patch
patch -Np1 -i ../n.patch
patch -Np1 -i ../o.patch
patch -Np1 -i ../p1.patch
patch -Np1 -i ../p2.patch
patch -Np1 -i ../narnia1.patch



#patch -Np1 -i ../9k.patch
patch -Np1 -i ../048.patch

patch -Np1 -i ../12.patch
patch -Np1 -i ../16.patch



patch -Np1 -i ../k1.patch
patch -Np1 -i ../k2.patch

patch -Np1 -i ../edgy.patch
patch -Np1 -i ../r21.patch
  # Fix build with glibc 2.26

patch -Np1 -i ../gna.patch
  patch -Np1 -i ../gnb.patch
patch -Np1 -i ../desu.patch




 
  # Fix incorrect inclusion of <string_view> in modes other than >= C++17
  
  # Fixes from Gentoo

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +

  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries




  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
python2 tools/clang/scripts/update.py

  cd "$srcdir/chromium-launcher-$_launcher_ver"
patch -Np1 -i ../20.patch


}


build() {
  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/$name-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"
  export TMPDIR="$srcdir/temp"
  mkdir -p "$TMPDIR"

   local _flags=(
    "custom_toolchain=\"//build/toolchain/linux/unbundle:default\""
    "host_toolchain=\"//build/toolchain/linux/unbundle:default\""
    'symbol_level=0'
    'is_debug=false'
    'fatal_linker_warnings=false'
    'treat_warnings_as_errors=false'
    'fieldtrial_testing_like_official_build=true'
    'remove_webcore_debug_symbols=true'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'link_pulseaudio=true'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'linux_use_bundled_binutils=false'
    'use_custom_libcxx=false'
    'use_vaapi=false'
    'enable_hangout_services_extension=false'
    'enable_widevine=false'
    'enable_nacl=false'
    'enable_swiftshader=false'
    'enable_nacl_nonsfi=false'
    'enable_print_preview=true'
    'enable_remoting=false'
  )

      _clang_path="${srcdir}/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin"
      _c_compiler="${_clang_path}/clang"
      _cpp_compiler="${_clang_path}/clang++"
      export CXXFLAGS="${CXXFLAGS//-fno-plt/}"
      export CFLAGS="${CFLAGS//-fno-plt/}"
      CFLAGS+=' -Wno-unknown-warning-option'
      CXXFLAGS+=' -Wno-unknown-warning-option'


  # Export compilers
  msg2 "Setup ${_compiler} compiler${_compiler_msg}"
  export AR=ar
  export NM=nm
  export CC="${_c_compiler}"
  export CXX="${_cpp_compiler}"

  sed 's|is_win \|\| (is_linux && use_x11 && !is_chromeos)|false|g' -i third_party/angle/gni/angle.gni


  gn gen out/Release --args="${_flags[*]}" \
    --script-executable=/usr/bin/python2

python2 build/util/lastchange.py -m GPU_LISTS_VERSION \
--revision-id-only --header gpu/config/gpu_lists_version.h




#its optimized for 16 ram, if you get segfaults or crashes read linuxfromscratch.org/blfs/view/svn/xsoft/chromium.html

  ninja -j8 -C out/Release  pdf chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/snox/LICENSE.launcher"

  cd "$srcdir/$name-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/$pk/$pk"
  install -Dm644 "$srcdir/snox.desktop" \
    "$pkgdir/usr/share/applications/snox.desktop"

  install -Dm4755 out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/snox/chrome-sandbox"

  cp -a \
    out/Release/{chrome_{100,200}_percent,resources}.pak \
    out/Release/{*.bin,chromedriver} \
    out/Release/locales \
    "$pkgdir/usr/lib/snox/"

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Release/icudtl.dat "$pkgdir/usr/lib/snox/"
  fi

  ln -s /usr/lib/$pk/chromedriver "$pkgdir/usr/bin/snoxdriver"

  for size in 16 22 24 32 48 64 128 256; do
    install -Dm644 "$srcdir/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pk.png"
  done



  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/snox/LICENSE"
}

# vim:set ts=2 sw=2 et:
