# MooreThreads MUSA archlinux PKGBUILD

## Usage

1. download source/objects from mthreads: https://developer.mthreads.com/sdk/download/musa?equipment=&os=&driverVersion=&version=
2. put the zip at this dir
3. `makepkg -Cf`
4. `pacman -U ./mtgpu-dkms-...`
5. `pacman -U ./musa-userspace-...`

## Pytorch

1. download wheels from https://github.com/MooreThreads/torch_musa/releases
2. prepare python3.9: (just from AUR)
3. make venv
4. install downloaded wheels and pytest, packaging
5. `python -c "import torch; import torch_musa; print(torch.musa.is_available())"`
