# Maintainer: Andrew Shark <ashark on linuxcomp.ru>
pkgname=amd-vulkan-prefixes
pkgver=3
pkgrel=1
pkgdesc="Select needed vulkan implementation with vk_radv, vk_amdvlk or vk_pro prefix"
arch=('any')
license=('GPL')
url="https://gitlab.com/AndrewShark/amd-vulkan-prefixes"
source=(https://gitlab.com/AndrewShark/amd-vulkan-prefixes/-/raw/main/amd_vulkan_prefixes.sh
        https://gitlab.com/AndrewShark/amd-vulkan-prefixes/-/raw/main/amd_vulkan_prefixes.bash-completion)
sha256sums=("51a9545af95f15d4660bbf5887099b9d30e0a9ea01fb98e03194e153a4ebf8e3"
            "aaf96ea2ae87c7dab678e8a33986199256312dd70004aec87b5fd0f8b65ebaef")


package() {
    install -Dm755 "${srcdir}"/amd_vulkan_prefixes.sh "${pkgdir}"/usr/bin/vk_radv
    install -Dm755 "${srcdir}"/amd_vulkan_prefixes.sh "${pkgdir}"/usr/bin/vk_amdvlk
    install -Dm755 "${srcdir}"/amd_vulkan_prefixes.sh "${pkgdir}"/usr/bin/vk_pro
    
    install -Dm755 "${srcdir}"/amd_vulkan_prefixes.bash-completion "${pkgdir}"/usr/share/bash-completion/completions/vk_radv
    install -Dm755 "${srcdir}"/amd_vulkan_prefixes.bash-completion "${pkgdir}"/usr/share/bash-completion/completions/vk_amdvlk
    install -Dm755 "${srcdir}"/amd_vulkan_prefixes.bash-completion "${pkgdir}"/usr/share/bash-completion/completions/vk_pro
}
