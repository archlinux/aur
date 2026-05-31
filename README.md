# MachCtrl

Monitor e Otimizador de Hardware para Linux — CPU, GPU, RAM, Fans, Temperatura.

![Plataforma](https://img.shields.io/badge/plataforma-Arch%20%7C%20CachyOS-blue)
![DE](https://img.shields.io/badge/desktop-KDE%20%7C%20GNOME-orange)
![License](https://img.shields.io/badge/license-MIT-green)

## Funcionalidades

- Monitor de CPU com grid de threads estilo Task Manager
- Controle de fans com curva de temperatura personalizada
- Suporte a GPU AMD (amdgpu) e NVIDIA (nvidia-smi)
- Monitor de GPU: uso, VRAM, temperatura, driver
- Monitor de RAM, rede, armazenamento
- Tarefas de limpeza do sistema (pip, npm, docker, flatpak, lixeira)
- Backend como serviço systemd — inicia automaticamente no boot

## Requisitos

- **Arch Linux** ou derivado (CachyOS, Manjaro, EndeavourOS...)
- **KDE Plasma** ou **GNOME** (outros DEs podem funcionar mas não são oficialmente suportados)
- GPU AMD: suportada nativamente via `amdgpu`
- GPU NVIDIA: requer `nvidia-utils` e opcionalmente `nvidia-settings`

## Instalação via AUR

```bash
yay -S machctrl
# ou
paru -S machctrl
```

## Instalação manual

```bash
git clone https://github.com/araujo791/machctrl.git ~/machctrl
cd ~/machctrl
sudo bash install.sh
```

## Após instalar

```bash
machctrl                              # abre o app
systemctl status machctrl-backend    # verifica o backend
journalctl -u machctrl-backend -f    # logs em tempo real
```

## Desinstalar

```bash
# Via AUR
yay -R machctrl

# Manual
sudo systemctl stop machctrl-backend
sudo systemctl disable machctrl-backend
sudo rm -rf /opt/machctrl /usr/local/bin/machctrl
sudo rm /etc/systemd/system/machctrl-backend.service
sudo rm /usr/share/applications/machctrl.desktop
```
<img src="https://i.ibb.co/DDqZ2BhL/Captura-de-tela-20260530-193716.png" alt="Captura de tela 20260530 193716" border="0">
<img src="https://i.ibb.co/gb55T0Yw/Captura-de-tela-20260530-193735.png" alt="Captura de tela 20260530 193735" border="0">
<img src="https://i.ibb.co/JwD052t8/Captura-de-tela-20260530-193809.png" alt="Captura de tela 20260530 193809" border="0">
<img src="https://i.ibb.co/qF0Xyqwz/Captura-de-tela-20260530-193823.png" alt="Captura de tela 20260530 193823" border="0">
<img src="https://i.ibb.co/wZyMSKhQ/Captura-de-tela-20260530-193830.png" alt="Captura de tela 20260530 193830" border="0">
<img src="https://i.ibb.co/3mzKGfmX/Captura-de-tela-20260530-193837.png" alt="Captura de tela 20260530 193837" border="0">
<img src="https://i.ibb.co/678K2qgp/Captura-de-tela-20260530-194008.png" alt="Captura de tela 20260530 194008" border="0">
