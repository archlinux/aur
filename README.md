# argocd-autopilot-bin

Downloads the latest official `argocd-autopilot` binary.

## How to publish to AUR

```shell
git remote add aur ssh://aur@aur.archlinux.org/argocd-autopilot-bin.git
```

```shell
git push aur main:master
```

## Building locally in container

```shell
docker build -t makepkg .
```

```shell
docker run --rm -it makepkg
```