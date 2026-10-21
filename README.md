# visual-studio-code-autoupdate

Pacote Arch/AUR do VS Code Stable x86_64 com atualização automática diretamente
da Microsoft. Não é um pacote oficial da Microsoft.

## instalar e abrir

```sh
makepkg -si
```

A instalação pelo pacman entrega o editor completo, os ícones, os atalhos e a
atualização automática configurada. Depois, abra Visual Studio Code no menu ou
execute `code`. **A primeira abertura não pede sudo/Polkit, não configura serviços
e não baixa o editor.** Não execute o editor como root.

O instalador usa os privilégios que o pacman já possui para:

1. Criar a conta de sistema sem login `vscode-autoupdate`.
2. Preparar `/var/lib/visual-studio-code-autoupdate`, a trava e o link para o editor
   incluído no pacote.
3. Habilitar e iniciar o timer do sistema. Em uma instalação offline/chroot,
   habilita o timer para o próximo boot.

Não escolhe um usuário de desktop, não depende de `SUDO_USER` e não exige uma
sessão systemd de usuário. Os downloads agendados rodam como `vscode-autoupdate`,
**não como root**. Usuários de desktop podem executar o editor, mas não modificar
os binários compartilhados. Configurações e extensões continuam individuais em
`~/.config/Code` e `~/.vscode`, sem alterações pelo instalador ou atualizador.

## versão inicial e integridade

Cada build consulta
`https://update.code.visualstudio.com/api/update/linux-x64/stable/latest`, baixa
exatamente a URL retornada e valida seu SHA-256 e o commit do conteúdo antes de
empacotar. Erros de rede, integridade ou extração interrompem o build: não geram
um pacote sem editor. O mesmo código de verificação é usado nas atualizações.

A receita não fixa a versão nem o hash do editor. Os hashes dos scripts locais
continuam em `sha256sums`. Dois builds da mesma revisão podem incluir versões
diferentes do VS Code. Um pacote binário reutilizado do cache contém a versão
do seu build, não necessariamente a mais recente no momento da instalação.
Para reconstruir consultando a versão atual:

```sh
makepkg --cleanbuild --force
```

Não use `--noextract` nessa reconstrução: ele pula `prepare()`, que consulta a
Microsoft. A revisão `1.0-5` identifica este empacotamento, não a versão do editor.

O pacman controla o editor inicial em
`/usr/lib/visual-studio-code-autoupdate/release-<commit>`, o lançador e a integração.
As versões posteriores ficam em `/var/lib/visual-studio-code-autoupdate` e não
são controladas nem revertidas pelo pacman. As dependências do editor ainda
podem exigir manutenção do pacote quando a Microsoft mudar seus requisitos.

## atualização automática

- O timer do sistema verifica às 00h e 12h, com atraso aleatório de até 15 minutos.
  `Persistent=true` recupera verificações perdidas enquanto o sistema estava desligado.
- A versão incluída no pacote não é baixada de novo se ainda for a atual.
- A troca do link `current` é atômica. Falhas de download preservam a release atual.
- O atualizador e o lançador compartilham uma trava. Novas aberturas podem aguardar
  uma atualização em andamento; `code --wait` não mantém essa trava durante a edição.
- Não reinicia janelas. A limpeza considera processos de todos os usuários;
  quando não pode descartar um editor em execução, conserva as releases antigas.
- Downloads temporários interrompidos são removidos na próxima verificação.
- O serviço só pode escrever no seu diretório de estado e não acessa as pastas pessoais.

Operação administrativa opcional; nenhum destes comandos é necessário para abrir o editor:

```sh
systemctl list-timers vscode-update.timer
journalctl -u vscode-update.service
sudo systemctl start vscode-update.service         # verificar agora
sudo systemctl disable --now vscode-update.timer   # desativar automação
```

## migração de versões anteriores

Ao atualizar de `1.0-4` ou anterior, o instalador desabilita o timer do antigo
usuário dono de `/opt/vscode` e para o serviço antigo quando sua sessão está ativa.
As unidades por usuário e o helper Polkit deixam de fazer parte do pacote.
A nova instalação usa o serviço do sistema e o editor incluído no pacote.

O conteúdo antigo de `/opt/vscode` é preservado durante a atualização para não
apagar releases que possam estar em execução; ele será removido na desinstalação.
Não é usado pelo novo lançador nem copiado para o estado do serviço: executáveis
antes graváveis por um usuário não devem virar binários compartilhados.
Cópias manuais em `~/.local/bin` não pertencem ao pacote e podem continuar tendo
prioridade sobre `/usr/bin/code`; o instalador não remove arquivos pessoais.

## desinstalar

Feche o editor e execute:

```sh
sudo pacman -R visual-studio-code-autoupdate
```

A desinstalação desabilita o timer, para o serviço e remove
`/var/lib/visual-studio-code-autoupdate`, `/opt/vscode`, a marca persistente do timer,
a conta `vscode-autoupdate` e seu grupo. Os arquivos empacotados são removidos pelo
pacman. Não guarde projetos nesses diretórios de binários descartáveis.
Configurações, extensões e projetos pessoais são preservados.

## verificação e publicação

O `check()` executa testes sem rede de integridade, extração segura, troca atômica,
proteção de releases em execução e lançamento sem preparação privilegiada.
A verificação de instalação usa namespaces isolados: executa os hooks e as
ferramentas reais de criação de conta, diretórios e habilitação do timer; roda o
atualizador como a conta de serviço e abre o editor como outro usuário, sem rede
e com Polkit indisponível. A ativação em um systemd de sistema já rodando depende
do ambiente de instalação; a habilitação para boot é verificada separadamente.

O AUR recebe `PKGBUILD`, `.SRCINFO` e os fontes locais, não os arquivos
`.pkg.tar.zst`. Compilar não publica nem envia nada ao AUR.
A licença comercial da Microsoft acompanha o editor e é instalada em
`/usr/share/licenses/visual-studio-code-autoupdate/LICENSE.rtf`.
A licença 0BSD aplica-se apenas aos scripts e arquivos deste projeto.

Referências: [regras de empacotamento](https://wiki.archlinux.org/title/Arch_package_guidelines),
[envio ao AUR](https://wiki.archlinux.org/title/AUR_submission_guidelines) e
[instalação oficial no Linux](https://code.visualstudio.com/docs/setup/linux).
