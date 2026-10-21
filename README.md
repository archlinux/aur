# visual-studio-code-autoupdate

Pacote Arch/AUR para atualizar o VS Code Stable x86_64 diretamente da Microsoft,
sem aguardar uma nova versão do PKGBUILD a cada lançamento do editor.
Não é um pacote oficial da Microsoft.

## funcionamento e limites

- Instala `code`, `vscode-update`, integração gráfica e unidades systemd do usuário.
- Consulta `https://update.code.visualstudio.com/api/update/linux-x64/stable/latest`.
- Confere o SHA-256 anunciado pela Microsoft antes de extrair o `.tar.gz`.
- Mantém versões em `/opt/vscode/release-<commit>` e troca `current` atomicamente.
- Não fecha janelas. Conserva uma versão antiga enquanto seu executável está rodando;
  uma verificação posterior remove essa versão quando não estiver mais em uso.
- Verifica às 00h e 12h, no fuso local, com atraso aleatório de até 15 minutos.
  `Persistent=true` recupera uma verificação perdida quando o timer volta a funcionar.
- O timer depende da sessão do usuário. Não habilita linger nem roda como root.
- Não altera `~/.config/Code` nem `~/.vscode`.

O `pacman` controla o atualizador e sua integração, **não** as versões baixadas do
VS Code. A versão `0.0-3` identifica o desenvolvimento ainda não publicado deste
atualizador, não a versão do editor. A primeira publicação será `1.0`.
As versões do editor não aparecem no histórico de transações do pacman e não
podem ser revertidas por ele. As dependências do editor ainda podem exigir
manutenção deste pacote no futuro.

O destino é exclusivo de **um usuário atualizador**. Não é uma solução multiusuário:
seu conteúdo é gravável por esse usuário, embora seja legível no sistema.
Não execute o editor nem o atualizador como root. O pacote não inclui os binários
da Microsoft; a licença comercial acompanha cada download em
`/opt/vscode/current/resources/app/LICENSE.rtf`. A licença 0BSD aplica-se somente
aos scripts e arquivos deste projeto.

## compilar e instalar

Na pasta do projeto, como usuário comum:

```sh
makepkg -si
```

Para apenas compilar, use `makepkg`. O `check()` executa testes sem rede para
verificação de integridade, extração segura e preservação de versões em execução.

O `namcap` emite avisos de pacote sem ELF em `x86_64` e de dependências que não
consegue inferir. O payload baixado é exclusivamente x86_64; as dependências
atendem esse payload, o systemd, HTTPS, o lançador e os hooks de integração MIME.
Não devem ser removidas apenas para silenciar esses avisos.

Na verificação local, o pacote foi compilado com os três testes aprovados.
O atualizador extraído do pacote baixou e instalou o VS Code `1.143.0` em um
diretório temporário, executou `code --version` e confirmou uma segunda execução
sem reinstalação. Esse teste não instalou o pacote no sistema nem alterou a
instalação existente em `/opt/vscode`.

Depois da instalação, execute na sessão gráfica do usuário que será o dono do
diretório. Se `/opt/vscode` já existir, confirme que não é um link simbólico e que
pertence à instalação que pretende manter; não tome o diretório de outro usuário.

```sh
sudo install -d -m 0755 -o "$USER" -g "$(id -gn)" /opt/vscode
systemctl --user daemon-reload
systemctl --user start vscode-update.service
systemctl --user enable --now vscode-update.timer
```

A primeira execução baixa o editor. A ativação é explícita: instalar o pacote não
habilita serviços automaticamente nem altera arquivos pessoais do usuário.

## migrar a instalação manual criada nesta sessão

Mantenha `/opt/vscode` e seus dados. Depois de instalar o pacote, retire apenas as
cópias locais criadas para essa instalação; elas têm prioridade sobre os arquivos
instalados pelo pacman. Não remova arquivos de outra origem.
O bloco verifica primeiro se o pacote e suas unidades estão instalados. Os `&&`
interrompem a migração em caso de falha, antes de remover as cópias locais.

```sh
pacman -Q visual-studio-code-autoupdate &&
test -x /usr/bin/vscode-update &&
test -f /usr/lib/systemd/user/vscode-update.service &&
test -f /usr/lib/systemd/user/vscode-update.timer &&
systemctl --user daemon-reload &&
systemctl --user disable --now vscode-update.timer &&
rm -f -- ~/.config/systemd/user/vscode-update.service \
  ~/.config/systemd/user/vscode-update.timer \
  ~/.local/bin/vscode-update ~/.local/bin/code \
  ~/.local/share/applications/com.microsoft.VSCode.desktop \
  ~/.local/share/applications/com.microsoft.VSCode.UrlHandler.desktop &&
systemctl --user daemon-reload &&
systemctl --user start vscode-update.service &&
systemctl --user enable --now vscode-update.timer &&
update-desktop-database ~/.local/share/applications &&
hash -r
```

Não há necessidade de mover configurações ou reinstalar extensões.

## operação e desinstalação

```sh
vscode-update                                      # verificar agora
systemctl --user list-timers vscode-update.timer   # próxima execução
journalctl --user -u vscode-update.service         # resultados
systemctl --user disable --now vscode-update.timer # desativar automação
```

Salve e feche o editor e execute:

```sh
sudo pacman -R visual-studio-code-autoupdate
```

A desinstalação desabilita o timer do usuário dono de `/opt/vscode`, para o timer
e o serviço se a sessão estiver ativa e apaga `/opt/vscode` inteiro, incluindo
versões antigas, downloads temporários, o link `current` e a trava de atualização.
Não segue links simbólicos dentro desse diretório nem remove dados em outros
sistemas de arquivos montados ali. Não mantenha projetos ou arquivos pessoais
em `/opt/vscode`: esse diretório é exclusivamente o payload descartável do pacote.
Configurações e extensões em `~/.config/Code` e `~/.vscode` são preservadas.

## publicação no AUR

O diretório contém `PKGBUILD`, `.SRCINFO` e fontes locais. Binários `.pkg.tar.zst`
não devem ser enviados ao AUR. Para publicar é preciso usar uma conta AUR com
chave SSH cadastrada, confirmar nome/e-mail de mantenedor e enviar os fontes pelo
Git do AUR. Nenhum envio é feito ao compilar este projeto.

O pacote usa um nome próprio porque distribui um atualizador com agendamento,
não uma cópia versionada do editor como `visual-studio-code-bin`.
As regras de admissão do AUR continuam sob decisão dos mantenedores do serviço.

Referências: [regras de empacotamento](https://wiki.archlinux.org/title/Arch_package_guidelines),
[envio ao AUR](https://wiki.archlinux.org/title/AUR_submission_guidelines) e
[instalação oficial no Linux](https://code.visualstudio.com/docs/setup/linux).
