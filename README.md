# Mage Lab
----------------
*mage lab provides a high fidelity voice enabled AI interface with advanced, customizable tool calling*

| Upstream | AUR | License |
| -------- | --- | ------- |
| <https://magelab.ai> | <https://aur.archlinux.org/packages/magelab> | MIT |

## Mage Lab
mage lab is an AI control panel and intelligent interface for your desktop. It brings a powerful out of box experience and limitless configurability. it's a good time.

https://web.crabnebula.cloud/sapient-artifice/mage-lab/releases

## Install from th AUR

```
yay -S magelab-bin
# or
paru -S magelab-bin
```

## known issue
Some systems mage lab will crash when launching because of WebKitGTK’s DMA-BUF renderer. You can solve this by using `export WEBKIT_DISABLE_DMABUF_RENDERER=1 magelab`