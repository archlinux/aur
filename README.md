## Info 
This is a fork of Andrew Shark's archlinux-amdgpu-pro with support to 21.40+ 
and the new repository packaging , extra add-ons like provlk (requires amdvlk) and the new
AMD® Encoder Library , but it lacks many developer scripts (and requires manually updating the dependency list "on the developer side"
If a new update comes with new dependencies)

## Contribution
This a fork maintained by 14-yrs old guy who isn't very patient nor experienced with doing this type of stuff , 
so here's how you can help :
1. Rewrite missing .sh and .py scripts from upstream archlinux-amdgpu-pro .
2. When a New Update Hits repo.radeon.com update `GET-DEBS.sh` & `PKGBUILD` to support new changes
and dependencies (if I didn't do so already) .
3. Improve my scripts .

## Installation Steps
1. Configure the version you want in `versions` file , there you will find major,minor,amf,and encoder versions .
2. RUN `makepkg -si` to compile and install this package GROUP .
