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
- Novas aberturas pelo comando `code` aguardam uma atualização em andamento
  terminar. O lançador e o atualizador compartilham a mesma trava para impedir
  que a limpeza remova uma versão enquanto ela está sendo iniciada.
  A trava de lançamento é liberada após iniciar o processo da release; opções
  como `--wait` não bloqueiam as atualizações durante a edição.
  Se a varredura de processos ficar inconclusiva durante uma troca de processos,
  a remoção de releases antigas é adiada para uma verificação posterior.
- Downloads interrompidos são recolhidos na próxima verificação, sob essa trava,
  sem seguir links simbólicos deixados entre os temporários.
- Verifica às 00h e 12h, no fuso local, com atraso aleatório de até 15 minutos.
  `Persistent=true` recupera uma verificação perdida quando o timer volta a funcionar.
- O timer depende da sessão do usuário. Não habilita linger nem roda como root.
- Não altera `~/.config/Code` nem `~/.vscode`.

O `pacman` controla o atualizador e sua integração, **não** as versões baixadas do
VS Code. A versão do atualizador é `1.0`, não a versão do editor.
No Arch, `pkgrel=1` identifica a revisão do empacotamento; a versão pública
do programa permanece `1.0`. Ajustes antes da publicação não mudam essa versão.
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
integridade, extração segura, troca de versões, preservação de versões em execução
e recuperação de temporários abandonados.
A visão de processos dos testes é isolada: processos reais de teste são incluídos
explicitamente, sem depender de processos externos que podem terminar durante o build.

O `namcap` emite avisos de pacote sem ELF em `x86_64` e de dependências que não
consegue inferir. O payload baixado é exclusivamente x86_64; as dependências
atendem esse payload, o systemd, HTTPS, o lançador e os hooks de integração MIME.
Não devem ser removidas apenas para silenciar esses avisos.

A verificação de execução também inclui download real da Microsoft e execução
de `code --version` a partir de uma instalação isolada, sem modificar os dados
pessoais do usuário. Os testes não substituem a manutenção das dependências
quando a Microsoft altera os requisitos do editor.

Depois de instalar, execute `code` normalmente ou abra Visual Studio Code no menu.
A primeira execução:

1. Cria `/opt/vscode` para o usuário atual, pedindo autorização pelo sistema via
   Polkit quando o diretório ainda não existe.
2. Baixa e valida o editor oficial da Microsoft, sem executar o download como root.
3. Habilita o timer do usuário e inicia o editor com os argumentos solicitados.

Não há comandos manuais de configuração. Se a autorização, o download ou a
ativação do timer falhar, a inicialização não é marcada como concluída; a próxima
execução tenta novamente. Um diretório pertencente a outro usuário ou um link
simbólico é recusado, sem trocar seu proprietário.

É necessária uma sessão systemd do usuário; a autorização inicial exige um agente
Polkit da sessão gráfica ou a autenticação oferecida por `pkexec` no terminal.
Depois da primeira configuração, as atualizações continuam sem sudo ou prompts.

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
