# $Id: PKGBUILD 277477 2016-10-01 03:36:40Z foutrelis $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=inox-hard
pk=inox
name=chromium
pkgver=63.0.3239.108
pkgrel=1
_launcher_ver=5
pkgdesc="A web browser built for speed, simplicity, and security"
arch=('i686' 'x86_64')
url="https://www.chromium.org/Home"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja' 'nodejs' 'git')
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
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/pt.patch
https://raw.githubusercontent.com/bn0785ac/inox-hardened/master/036.patch
)


sha256sums=('aaa714e14a608efda3b5312735496c2f85fe4b9776a9fcf818cea8d016a0cb49'
            '4dc3428f2c927955d9ae117f2fb24d098cc6dd67adb760ac9c82b522ec8b0587'
            'ff3f939a8757f482c1c5ba35c2c0f01ee80e2a2273c16238370081564350b148'
            '6e9a345f810d36068ee74ebba4708c70ab30421dad3571b6be5e9db635078ea8'
            '35435e8dae76737baafecdc76d74a1c97281c4179e416556e033a06a31468e6d'
            'd81319f168dad0e411c8e810f73daa2f56ff579578771bd9c9bb1aa2d7c09a8b'
            '2fc7be3e38fd8056b1ba964256c3f0b04128826e16d24e2766d402af22544b35'
            '9072ce92080e4ff67beea3cc04aebd3f316c196195db350eb49ae3a88ac61c83'
            '6b13e3bf360d8dbd1f722ff0c2c98cf6020806a4cb1f9af64d6c7b6216452230'
            '7d31949dc5e539d778a487b26e774e37060154e972a8a86dfd83c2ed432f26e0'
            '5c8c3ad7d5b4ebda7508e3aee13349fc8ad627d7a7e3147168e214f03e433168'
            '085c00b8f760b2262218ef772038a0d439bf208d61664ae15cf6088cc142fe47'
            '8696919f69ef927f095944ae7ef869b283450a4b2cdd4efdebc51fc2b1e747e0'
            'bd233779119f47a6f25d562dee0f725b47cf88b646a4828fd2c517d46839fd3e'
            'fd5fdc83665113677951e2e713a4696d999a070d6b59bb57319df357b35d4fad'
            '3850ad42d0cb4ca011d46b9d569a0a2bf83476f0c3da70c74d4f011cec59f885'
            '7beb0f3bbc55960092347767d423415860a3867525f6d1bbb057b3d72fae0618'
            'bcaeeb52d5d17fa9e6d4883cdeef8150f7e6ce440e0fcd3cef17d99f4b5db672'
            'f6a4c02feb5b21f1814d0b835b94a8b6222628ff97800b5411dc86852bfa5883'
            'b5532de9e402a7d0b12258e9de56722e7eec84dc54cd53b9fe25d62c7354c0af'
            'f4af2787f31abe66ab1180affed6f4c97daaad9151de429c9f5dc3e223cc8d87'
            '7ae51e5bd3c0dad1007cbf4991d7a68bcc76919f0247856328e1db65aedf8f91'
            '1632b2d3b9062e6ec8872b9df180f82a93099a50eda6f15125ffe56dd45beca6'
            'e6a3490da7b98e3c2d9d04bc595a3349779a0426dfe61aa955d6fb7daa816c12'
            '9be24cb424d59cea12944bdb451690728e373ece6e4e93dbae8b92078da2130d'
            'b35247d9ca4a7a40d9ca59e95ee9457245d903542e4c29033d200b6198396820'
            '7cde4208b87ba4632e2c83aa13163d3b34935d6175c868b671c74bb17b752fb5'
            '519965231b125f40a644829e50529befe496e02ca2e03ebc38d8791706bf2162'
            '900d9b967c5cade8c57caf0599f8048ee8ee79be4d3e6c1f91c4e934c91447de'
            '66d0a7672b29293080baa141540bfdf584d3f013c6d2115fa2c9dfa28beee934'
            'd975a6abd6cb8ff2a2178d9a4755ea978033af522a0b4121d025703133a87ca2'
            'a392decc52fff5cd660f293b26739d7203f8678cc57d560f1b42efff1d43dc0d'
            'dfac4673959a225462c629045db1c0fd736717d11d8256a9827b45c3b5dadc44'
            'db1d9f62899a1acf917394d807f10765f3cbeef63c42f1e8359239b806f42517'
            '3d66b22f1ba6d7309eafd93e3b0a3d9ec841828f88cd8e267a7760585776dd5b'
            '0a148b0a15a63feb08ed79695a80d09ad39db7a3373b217cd499909218b94fda'
            'cabe339110369d08b2cef0b4308ee8eb8385054583815c3927421588ae94d9e7'
            '5a4ec61000266fd623e0a3377210ed324ed62eeba6c61ecd95ffb49d4d20640f'
            '4570a87cb632896818f8bf96eb38157bcbcfec55e702683e36d8bc63b16764af'
            '3289899320780afe2face6a996e2a09bbfcdd4c159b900d4425ae01d25a8806f'
            '2acda9e5de0efa71c8347eb490bcae7993ae28dceaba406a0dafb50110539ba2'
            '1e9fc91a973977bdd03fddb65610f34e60a0fbd357033137dbb12f4657b14cf8'
            'ed1a7060c1bdb2697a4342e5d053435367ab4d1330b1fe88624fc38326c1191e'
            '216829c72f1cc378bc66fb4f62f047cccd31684d946ba9a406b6e7a8f1351677'
            '65103b6d7ccbe4ba115766942a555f6fd50db2a64a328f2b4ebd2b7ae72db88a'
            'e69053b14c008ee8c20134a022726c09a81b03ef18dc1298d2d8fda88211568f'
            '814fa3b82c8330b944b138ece864be4761fe17f42061816028b5d8c1f2609c8a'
            '8f7d2baca6d96b1e668c8c2bcb1efe5daa0e1cb33de89e12165ea22c73ce8741'
            '0ac16793634edde24c214eeffa9def755b9b76b256dfa3d9fd31de6002ff5dfa'
            'f79555d6517335891dd74521189b6f3eca543a02699c34fbb92c874b4f080674'
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
            'c4437d174967a4bbe4f466a614cde853d1ce58be0b5826a0d71f63fcd88ccf2e'
            '518edcadb1538bbcc3309039b9f7d7cff978f90ee9d547000a7e6821d5fa2d13'
            '776c4a7c55f406700714d427061556868d80ec786a2521a5e4660576b18c3d79'
            'cdc55ec692caffb02fba826308c6e39b0045674460098bda085237f2123798a0'
            '5a8b8c2bd45dd2f057b9d8b803b33661fb4ffe89ef35ecc5e61f44fe24c07a74'
            '127747c5c692b0b0ef62f0e6ae79c894cd4798846bba53bf23b0b8bbe6974ba0'
            '065a69ca6547e89f84ded7b95e29a7fb3ac762eaac3aa940ab1ec5a3ecbe3a2f'
            '0526518bd42da73113a88a440739a50fb85fb0c1e8528b1a8340747d901e3f5b'
            'c367599e25bd9d408d52dd26ceec9f0048b0991cc74980c8c40d602e61a2a844'
            'b54a69d6eeb03bf56e5a6430cbc07fd8d12532709876d38828e4c455eca29e3b'
            'dc5b12678bea3a694a722e3e88277300c4a15050ceb35c9f7d873a5f8ab1ba54'
            '6130351d4c918e5b60f0ea4914e7e2f26fe4221ac97bcecacb4161fd2d23906c'
            'fb3abae54309adf69b98bd2435fbc23f17bc526dbf1d1e97907da87e7cf0aeed'
            'a92129a1d018906a299b9b05c4a96375b115fdd6a3c019d3b326a30a4c107181'
            '2f1f0aa9592fad53ce9bc07fc91193257874247cf604421aac7e60911b2a6804'
            'ec350d3afdd23e3fdd51f0168244a33051cea9671ffdc4e455ddba3fc0da8349'
            '4e6c51c78d1990731ecec5240bb6d07bff6ce0562d94725892693ee4a50fb4bb'
            '698ffaa7d99a10c51cf19e31f5bafb071da91e780e738f401f2152877e527449'
            '399e1e6dd0d83fc9af2b74817db730661b963e99befc172a1ce0717f869575e6'
            'a72bfdbea4e1bf9c273a78ef9c186968b1e7dd3e993a4a381488d8b9c9613552'
            '502b4eca6edf10fe1d036ab2c65363b4300de91b381ce687e08bd96dc254c898'
            '0d7c128d362697e3ba80b7647826f8577b6fadea32462ad6fa37c877bc8f7643'
            'eea10be17469d859f6731e056d9914e91e8049698012ba399d441846d218d68b'
            'a5327677d62f34da26e7aa714d49e71f7ebfcdbcb16b37dd8fe34fdf0d92c438'
            'e660590ebc900879d059ea0b8f9cfbf66f45d0d43f04f1b11ce2d0daf781f265'
            '84d61c7ccc1e99dd593970bfff1cbc030b586cc90531541d17323e6b92f15230'
            'ba9f4b345150ed5a2df7b713ab1e441be7ab8aeead4e2eb0c384334cf15ad436'
            '9d144732d593d9ee82f99b24009a193e61ef8560aff92a15effdae95a0897c61')




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

  # Enable support for the Widevine CDM plugin
  # libwidevinecdm.so is not included, but can be copied over from Chrome
  # (Version string doesn't seem to matter so let's go with "Pinkie Pie")
  sed "s/@WIDEVINE_VERSION@/Pinkie Pie/" ../chromium-widevine.patch |
    patch -Np1

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
#patch -Np1 -i ../026.patch
patch -Np1 -i ../027.patch
patch -Np1 -i ../029.patch
patch -Np1 -i ../030.patch
patch -Np1 -i ../CP.patch
patch -Np1 -i ../032.patch
patch -Np1 -i ../034.patch
patch -Np1 -i ../036.patch
patch -Np1 -i ../037.patch
patch -Np1 -i ../038.patch
patch -Np1 -i ../888.patch
patch -Np1 -i ../pt.patch


msg2 'Cut media router'
patch -Np1 -i ../3992.patch
patch -Np1 -i ../2992.patch
patch -Np1 -i ../2ka.patch



#patch -Np1 -i ../2kc.patch
patch -Np1 -i ../2kd.patch
patch -Np1 -i ../2ke.patch
patch -Np1 -i ../2kf.patch
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
patch -Np1 -i ../e.patch
patch -Np1 -i ../k.patch
patch -Np1 -i ../k1.patch
patch -Np1 -i ../l.patch
patch -Np1 -i ../l2.patch
patch -Np1 -i ../l3.patch
patch -Np1 -i ../m.patch
patch -Np1 -i ../n.patch
patch -Np1 -i ../o.patch
patch -Np1 -i ../p.patch


#patch -Np1 -i ../9k.patch
#patch -Np1 -i ../048.patch

patch -Np1 -i ../12.patch
patch -Np1 -i ../16.patch


  # Fix build with glibc 2.26

  patch -Np1 -i ../gnb.patch




  # Fixes from Gentoo

msg2 'clean'
  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +

msg2 'bath'
  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"
msg 2 'nad'
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

msg2 'purge1'
  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${!_system_libs[@]} ${_system_libs[libjpeg]+libjpeg_turbo}; do
    find -type f -path "*third_party/$_lib/*" \
      \! -path "*third_party/$_lib/chromium/*" \
      \! -path "*third_party/$_lib/google/*" \
      \! -path "*base/third_party/icu/*" \
      \! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
      -delete
  done

msg2 'purge2'

  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
msg2 'purge3'

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
    'symbol_level=0'
    'is_debug=false'
    'fatal_linker_warnings=false'
    'treat_warnings_as_errors=false'
    'fieldtrial_testing_like_official_build=true'
    'remove_webcore_debug_symbols=true'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'link_pulseaudio=true'
    'use_gconf=false'
    'use_gnome_keyring=false'
    'use_gold=false'
    'use_sysroot=false'
    'linux_use_bundled_binutils=false'
    'use_custom_libcxx=false'
    'use_system_libjpeg=true'
    'use_vaapi=false'
    'enable_hangout_services_extension=false'
    'enable_widevine=false'
    'enable_webrtc=true'
    'enable_nacl=false'
    'enable_swiftshader=false'
    'enable_nacl_nonsfi=false'
    'enable_google_now=false'
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


  python2 tools/gn/bootstrap/bootstrap.py --gn-gen-args "${_flags[*]}"
  out/Release/gn gen out/Release --args="${_flags[*]}" \
    --script-executable=/usr/bin/python2

#python2 build/util/lastchange.py -m GPU_LISTS_VERSION --revision-id-only --header gpu/config/gpu_lists_version.h

  ninja -C out/Release chrome chrome_sandbox chromedriver widevinecdmadapter
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/inox/LICENSE.launcher"

  cd "$srcdir/$name-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/$pk/$pk"
  install -Dm644 "$srcdir/inox.desktop" \
    "$pkgdir/usr/share/applications/inox.desktop"

  install -Dm4755 out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/inox/chrome-sandbox"

  cp -a \
    out/Release/{chrome_{100,200}_percent,resources}.pak \
    out/Release/{*.bin,chromedriver} \
    out/Release/locales \
    "$pkgdir/usr/lib/inox/"

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Release/icudtl.dat "$pkgdir/usr/lib/inox/"
  fi

  ln -s /usr/lib/$pk/inoxdriver "$pkgdir/usr/bin/inoxdriver"

  for size in 16 22 24 32 48 64 128 256; do
    install -Dm644 "$srcdir/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pk.png"
  done



  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/inox/LICENSE"
}

# vim:set ts=2 sw=2 et:
