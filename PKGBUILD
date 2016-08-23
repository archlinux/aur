# Maintainer: Fabian(Tids) <plusfabi[AT+thegooglemailadress]>
pkgname=mhwd-addon-amdgpu-hwe
pkgver=20160822BETA
pkgrel=3
pkgdesc="Enables some extras for AMDGPU-open stack, like OpenCL, VAAPI & VDPAU"
arch=('any')
url=""
license=('custom')
depends=('mhwd-db' 'linux47' 'grub')
source=('MHWDCONFIG' 'amdgpu-hwe.ids')
md5sums=('94eefebebefb54c088be9995592aa16d'
         '475a1e63fd1bff0f203c159b6825ef3d')


package() {
    #cd "${srcdir}"
    mkdir -p "${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/xf86-video-amdgpu-hwe"
    install -D -m644 "${srcdir}/MHWDCONFIG" \
    "${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/xf86-video-amdgpu-hwe/MHWDCONFIG"
    
    mkdir -p "${pkgdir}/var/lib/mhwd/ids/pci"
    install -D -m644 "${srcdir}/amdgpu-hwe.ids" \
    "${pkgdir}/var/lib/mhwd/ids/pci/amdgpu-hwe.ids"    
}
