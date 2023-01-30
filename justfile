build:
    docker build -t makepkg .
    docker run -v $PWD:/volume --rm -it makepkg

push:
    git remote add aur ssh://aur@aur.archlinux.org/argocd-autopilot-bin.git &> /dev/null || true
    git push aur main:master