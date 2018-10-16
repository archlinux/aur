# Maintainer: Franc[e]sco <lolisamurai@tfwno.gf>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgbase=mesa-transform-feedback-git
pkgname=('mesa-transform-feedback-git')
pkgdesc="mesa with the RADV patches for VK_EXT_transform_feedback."
pkgver=18.3.0_devel.105152.ff281e6204
pkgrel=3
arch=('x86_64')
makedepends=('git' 'python-mako' 'llvm-svn' 'clang-svn' 'xorgproto'
              'libxml2' 'libx11'  'libvdpau' 'libva' 'elfutils' 'libomxil-bellagio'
              'ocl-icd' 'vulkan-icd-loader' 'libgcrypt'  'wayland' 'wayland-protocols' 'meson')
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
         'libomxil-bellagio' 'llvm-libs-svn' 'libunwind' 'libglvnd' 'wayland' 'lm_sensors' 'libclc')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau' 'vulkan-driver' 'opencl-mesa' 'opengl-driver' 'opencl-driver')
conflicts=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau')
url="https://www.mesa3d.org"
license=('custom')
source=(
  'mesa::git://anongit.freedesktop.org/mesa/mesa#commit=ff281e62043203fd83f3f88e2ed68828646e155d'
  '256575.patch::https://patchwork.freedesktop.org/patch/256575/raw/'
  '256578.patch::https://patchwork.freedesktop.org/patch/256578/raw/'
  '256579.patch::https://patchwork.freedesktop.org/patch/256579/raw/'
  '256576.patch::https://patchwork.freedesktop.org/patch/256576/raw/'
  '256577.patch::https://patchwork.freedesktop.org/patch/256577/raw/'
  '256585.patch::https://patchwork.freedesktop.org/patch/256585/raw/'
  '256582.patch::https://patchwork.freedesktop.org/patch/256582/raw/'
  '256581.patch::https://patchwork.freedesktop.org/patch/256581/raw/'
  '256583.patch::https://patchwork.freedesktop.org/patch/256583/raw/'
  '256580.patch::https://patchwork.freedesktop.org/patch/256580/raw/'
  '256586.patch::https://patchwork.freedesktop.org/patch/256586/raw/'
  '256587.patch::https://patchwork.freedesktop.org/patch/256587/raw/'
  '256584.patch::https://patchwork.freedesktop.org/patch/256584/raw/'
  '256588.patch::https://patchwork.freedesktop.org/patch/256588/raw/'
  'LICENSE'
)
sha512sums=(
  'SKIP'
  '3b6bb9102cf303cf072a02cc4327e8f44b103e5f3480ea95fbfa676217b1e9a99ccfb3e9394ff86776eb18d7bc4d4da2f7ddae9b398c0f6ee581a6306cd4e7dd'
  '366532619ca9205027524841ed22317e86f16098ec8cf6107b9b55353dece388a17ec60dab6e705428efdbba40fa086ad44e46562863fc0c3fb679ac0bbdbf36'
  '7f72f01004fa741622898318bb1107dc4fea528ee84f7d5bcf7d5c83ff306ba510ab9c5e95d1e83d2f6518f717e88b341e93dbca167f442f4902ad1e765c4f4a'
  'ccd5b18c0626b4577f098a2508b615a700e62617645091bf45bd61e27f2f8515b9b8d907a21c8dec6ac4ebc2f3672ee394bc2894db75d79f01525add04e4c619'
  'a440aa04444391de6d57354b6e0aee95335b658671a5ab4761c4a86165284b9435305c9281da22e05f904bf9a58677f68cb8331afc721948b0a888723fa21d20'
  'b0b8fefc7079aa663001eb8db01fb129429e9f51310c4499e3dbf77ca39248c6b55b93581487323441fa3e59040f5317eb43a7262805378a38853410db7c90d2'
  '3a37ae3cb51104e9336515d08dbdf8ce3ca0d0160fb30b0663216c9a8cd83a2ba62209c238ae6919cd4c84b75ec8cea573faf098430939c7ad85550c4d1f9fc7'
  '2d4cfb837db823e0307b2430fd2a1a9bf6363ac09ce11ef2052f487c593f5d25f6bd107b95fa572d1f970121d812b346aeba7f42f8c61a2cba33efc0ba660167'
  'abf6976bf05fb79dc3e321f1ba3ba067b9f552e70b92031716b984e0bf3c0bfda9f86765ce1ec71b044aaace66e1dcdf5acbaa71f42e551e2b2230ec27a25451'
  '9336f49610782a42218f17f187e75848afb42f3a82a4c9e1b69834a07b0cca31e0a462f6ad11a3359a247065a61dfb8079bd70dfe6a6172ee0c54d3a292c136d'
  '04d4272964759033b6c7ed980986c86fbb51aa46e8a949a722273cfb17468d08c5d1c1a13867935bd1aed90c14e05ca414beb548edf27833e2cdc96699e2c5a0'
  'b448ac97d1b5aac30424365c48f63dcbb2d7e8e36a5d9970bac13eb80e1041bc896521c55d39702e65b3609b6a8813a1124cca8db1f73a818f2f9f07fabc8a57'
  '28e909d174a8e166e6506e98300d06ff684ecb0f15fbc5ea5dce578e889f88d18e64449ca27557aa83f64cd264db2e149645d7c4ba9afa749d100bfff280a8b0'
  '5a169d06c364c680ed6eb94b69eb84e82f7d715c2aff3712585dc9b7305aff3ef367573abc27c127c9c94cec915a5c513d631de1ee16847526ce0c4b9bb942c1'
  '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
)

pkgver() {
    cd mesa
    read -r _ver <VERSION
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build () {
    if [  -d _build ]; then
        rm -rf _build
    fi
    for p in \
      256575 \
      256578 \
      256579 \
      256576 \
      256577 \
      256585 \
      256582 \
      256581 \
      256583 \
      256580 \
      256586 \
      256587 \
      256584 \
      256588
    do
      echo "applying $p"
      patch -d mesa -Np1 < $p.patch
    done
    meson setup mesa _build \
       -D b_ndebug=true \
       -D buildtype=plain \
       --wrap-mode=nofallback \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D platforms=x11,wayland,drm,surfaceless \
       -D dri-drivers=i915,i965,r200,r100,nouveau \
       -D gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl \
       -D vulkan-drivers=amd,intel \
       -D dri3=true \
       -D egl=true \
       -D gallium-extra-hud=true \
       -D gallium-nine=true \
       -D gallium-omx=bellagio \
       -D gallium-va=true \
       -D gallium-vdpau=true \
       -D gallium-xa=true \
       -D gallium-xvmc=false \
       -D gbm=true \
       -D gles1=true \
       -D gles2=true \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=true \
       -D llvm=true \
       -D lmsensors=true \
       -D osmesa=gallium \
       -D shared-glapi=true \
       -D gallium-opencl=icd \
       -D valgrind=false \
       -D tools=[]
    meson configure _build
    ninja -C _build
}


package_mesa-transform-feedback-git() {

  DESTDIR="$pkgdir" ninja -C _build install

  # remove files provided by libglvnd
  rm "$pkgdir"/usr/lib/libGLESv{1_CM,2}.so*
   
  # indirect rendering
  ln -s /usr/lib/libGLX_mesa.so.0 ${pkgdir}/usr/lib/libGLX_indirect.so.0

  install -Dt "$pkgdir"/usr/share/licenses/$pkgbase "$srcdir"/LICENSE
}
