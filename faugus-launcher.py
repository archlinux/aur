#!/usr/bin/env python3

import os
import re
import shutil
import signal
import subprocess

import gi

# Importa os módulos necessários do Gtk
gi.require_version('Gtk', '3.0')
gi.require_version('Gdk', '3.0')
from gi.repository import Gtk, Gdk


# Classe para caixa de diálogo de confirmação
class ConfirmacaoDialog(Gtk.Dialog):
    def __init__(self, parent, mensagem):
        Gtk.Dialog.__init__(self, title="Remove Game")

        self.set_decorated(False)
        self.set_resizable(False)
        self.set_default_size(300, 100)

        # Cria um container
        container = Gtk.Grid()
        container.set_column_homogeneous(True)
        container.set_row_homogeneous(True)
        container.set_row_spacing(10)
        container.set_column_spacing(10)
        container.set_border_width(10)

        # Define a cor de fundo do container para branco
        #container.override_background_color(Gtk.StateFlags.NORMAL, Gdk.RGBA(0, 0, 0, 1))

        # Adiciona o container à janela do diálogo
        self.get_content_area().add(container)

        # Adiciona um label ao container
        # label = Gtk.Label(label="Are you sure?")
        label = Gtk.Label()
        label.set_label("Are you sure?")
        label.set_halign(Gtk.Align.CENTER)  # Centraliza horizontalmente
        container.attach(label, 0, 0, 2, 1)

        # Adiciona os botão NO ao container
        # button1 = Gtk.Button(label="NO")
        btn_no = Gtk.Button(image=Gtk.Image.new_from_icon_name("gtk-cancel", Gtk.IconSize.BUTTON))
        btn_no.connect("clicked", lambda x: self.response(Gtk.ResponseType.NO))
        container.attach(btn_no, 0, 1, 1, 1)

        # Adiciona os botão NO ao container
        # button2 = Gtk.Button(label="YES")
        btn_yes = Gtk.Button(image=Gtk.Image.new_from_icon_name("gtk-ok", Gtk.IconSize.BUTTON))
        btn_yes.connect("clicked", lambda x: self.response(Gtk.ResponseType.YES))
        container.attach(btn_yes, 1, 1, 1, 1)

        # Adiciona um check box ao container
        self.checkbox = Gtk.CheckButton(label="Also remove the prefix")
        self.checkbox.set_halign(Gtk.Align.CENTER)  # Centraliza horizontalmente
        container.attach(self.checkbox, 0, 2, 2, 1)

        # Exibe todos os elementos
        self.show_all()

    def get_remove_prefix_state(self):
        # Retorna o estado do checkbox "Also remove the prefix"
        return self.checkbox.get_active()


# Classe para caixa de diálogo de adição/edição de jogo
class AdicionarJogoDialog(Gtk.Dialog):
    def __init__(self, parent):
        super().__init__(title="Add/Edit Game", parent=parent)
        self.set_default_size(640, 480)
        self.set_resizable(False)
        self.set_modal(True)  # Torna a janela de diálogo modal

        self.box = self.get_content_area()
        grid = Gtk.Grid()
        grid.set_row_spacing(10)
        grid.set_column_spacing(10)
        grid.set_margin_start(10)
        grid.set_margin_end(10)
        grid.set_margin_top(10)
        grid.set_margin_bottom(10)

        # Widgets para a entrada de dados do jogo
        self.nome_label = Gtk.Label(label="Title:")
        self.nome_entry = Gtk.Entry()

        self.caminho_label = Gtk.Label(label="Path:")
        self.caminho_entry = Gtk.Entry()
        self.procurar_button = Gtk.Button()
        self.procurar_button.set_image(Gtk.Image.new_from_icon_name("system-search", Gtk.IconSize.BUTTON))
        self.procurar_button.connect("clicked", self.on_procurar_clicked)

        # Adicionar o novo campo Prefix
        self.prefix_label = Gtk.Label(label="Prefix:")
        self.prefix_entry = Gtk.Entry()

        self.argumentos_label = Gtk.Label(label="Launch Arguments:")
        self.argumentos_entry = Gtk.Entry()

        self.sufixo_label = Gtk.Label(label="Game's Arguments:")
        self.sufixo_entry = Gtk.Entry()

        # Dropdown menu
        self.dropdown_label = Gtk.Label(label="Runner:")
        self.dropdown_menu = Gtk.ComboBoxText()
        self.dropdown_menu.connect("changed", self.on_dropdown_changed)
        self.populate_dropdown()

        # Checkboxes
        self.mangohud_checkbox = Gtk.CheckButton(label="MangoHud")
        self.gamemode_checkbox = Gtk.CheckButton(label="Feral Game Mode")

        # Button
        self.winetricks_button = Gtk.Button(label="Winetricks")
        self.winetricks_button.connect("clicked", self.on_winetricks_clicked)

        # Conecta o sinal de mudança no campo Nome para atualizar dinamicamente o campo Prefix
        self.nome_entry.connect("changed", self.atualizar_prefix_entry)

        # Adiciona os widgets ao grid
        grid.attach(self.nome_label, 0, 0, 1, 1)
        grid.attach(self.nome_entry, 1, 0, 3, 1)

        grid.attach(self.caminho_label, 0, 1, 1, 1)
        grid.attach(self.caminho_entry, 1, 1, 2, 1)
        self.caminho_entry.set_hexpand(True)
        grid.attach(self.procurar_button, 3, 1, 1, 1)

        # Adicionar o novo campo Prefix
        grid.attach(self.prefix_label, 0, 2, 1, 1)
        grid.attach(self.prefix_entry, 1, 2, 3, 1)

        grid.attach(self.argumentos_label, 0, 3, 1, 1)
        grid.attach(self.argumentos_entry, 1, 3, 3, 1)

        grid.attach(self.sufixo_label, 0, 4, 1, 1)
        grid.attach(self.sufixo_entry, 1, 4, 3, 1)

        grid.attach(self.dropdown_label, 0, 5, 1, 1)
        grid.attach(self.dropdown_menu, 1, 5, 3, 1)

        # Adiciona as checkboxes e o botão ao grid
        grid.attach(self.mangohud_checkbox, 0, 6, 1, 1)
        grid.attach(self.gamemode_checkbox, 1, 6, 1, 1)
        grid.attach(self.winetricks_button, 2, 6, 2, 1)

        # Adiciona o grid à caixa de diálogo
        self.box.add(grid)

        # Adiciona botões de cancelar e OK
        cancel_button = Gtk.Button()
        cancel_button.add(Gtk.Image.new_from_icon_name("gtk-cancel", Gtk.IconSize.BUTTON))
        self.add_action_widget(cancel_button, Gtk.ResponseType.CANCEL)

        ok_button = Gtk.Button()
        ok_button.add(Gtk.Image.new_from_icon_name("gtk-ok", Gtk.IconSize.BUTTON))
        self.add_action_widget(ok_button, Gtk.ResponseType.OK)

        # Verificação para MangoHud
        mangohud_enabled = os.path.exists("/usr/bin/mangohud")
        # self.mangohud_checkbox = Gtk.CheckButton(label="MangoHud")
        if not mangohud_enabled:
            self.mangohud_checkbox.set_sensitive(False)  # Torna o checkbox insensível
            self.mangohud_checkbox.set_active(False)  # Desmarca o checkbox

        # Verificação para Game Mode
        gamemode_enabled = os.path.exists("/usr/bin/gamemoderun")
        if not gamemode_enabled:
            self.gamemode_checkbox.set_sensitive(False)  # Torna o checkbox insensível
            self.gamemode_checkbox.set_active(False)  # Desmarca o checkbox

        # Verificação para Winetricks
        winetricks_enabled = os.path.exists("/usr/bin/winetricks")
        if not winetricks_enabled:
            self.winetricks_button.set_sensitive(False)  # Torna o botão insensível

        # Exibe todos os elementos
        self.show_all()

    # Método para atualizar dinamicamente o campo Prefix
    def atualizar_prefix_entry(self, widget):
        nome_jogo_formatado = re.sub(r'[^a-zA-Z0-9\s]', '', self.nome_entry.get_text())
        nome_jogo_formatado = nome_jogo_formatado.replace(' ', '-')
        nome_jogo_formatado = '-'.join(nome_jogo_formatado.lower().split())
        prefix = os.path.expanduser("~/.config/faugus-launcher/prefixes/") + nome_jogo_formatado
        self.prefix_entry.set_text(prefix)

    def carregar_estado_checkboxes(self, mangohud, gamemode):
        # Define o estado dos checkboxes com base nos valores fornecidos
        self.mangohud_checkbox.set_active(mangohud)
        self.gamemode_checkbox.set_active(gamemode)

    def on_winetricks_clicked(self, widget):
        # Callback para o botão de Winetricks
        nome_jogo_formatado = re.sub(r'[^a-zA-Z0-9\s]', '', self.nome_entry.get_text())
        nome_jogo_formatado = nome_jogo_formatado.replace(' ', '-')
        nome_jogo_formatado = '-'.join(nome_jogo_formatado.lower().split())

        # Obtém o texto do campo Prefixo
        prefixo_jogo = self.prefix_entry.get_text()

        comando = (f'WINEPREFIX={prefixo_jogo} '
                   f'{os.path.expanduser("/usr/bin/wine")} -v win10')

        subprocess.Popen(["/bin/bash", "-c", comando])

        comando = (f'WINEPREFIX={prefixo_jogo} '
                   f'{os.path.expanduser("/usr/bin/winetricks")} ')

        subprocess.Popen(["/bin/bash", "-c", comando])

    def populate_dropdown(self):
        # Verifica se os diretórios existem e adiciona opções ao dropdown
        if os.path.exists(os.path.expanduser("~/.steam/steam/steamapps/common/Proton - Experimental")):
            self.dropdown_menu.append_text("Proton Experimental")

        compatibility_tools_dir = os.path.expanduser("~/.steam/steam/compatibilitytools.d/")
        if os.path.exists(compatibility_tools_dir):
            for item in os.listdir(compatibility_tools_dir):
                item_path = os.path.join(compatibility_tools_dir, item)
                if os.path.isdir(item_path) and item != "ULWGL-Launcher":
                    self.dropdown_menu.append_text(item)

        # if os.path.exists("/usr/bin/wine64"):  #    self.dropdown_menu.append_text("Wine")

    def on_dropdown_changed(self, widget):
        # Este método será chamado sempre que houver uma mudança no dropdown
        pass

    def on_procurar_clicked(self, widget):
        # Callback para o botão de procurar
        dialog = Gtk.FileChooserDialog(title="Select the game's .exe", parent=self, action=Gtk.FileChooserAction.OPEN, )

        dialog.set_current_folder("$HOME/")
        dialog.add_buttons(Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL, Gtk.STOCK_OPEN, Gtk.ResponseType.OK)

        response = dialog.run()
        if response == Gtk.ResponseType.OK:
            self.caminho_entry.set_text(dialog.get_filename())

        dialog.destroy()

    def validar_campos(self):
        # Validação dos campos antes de adicionar/editar um jogo
        nome = self.nome_entry.get_text()
        caminho = self.caminho_entry.get_text()

        if not nome or not caminho:
            self.exibir_mensagem_aviso("Title and Path need to be filled")
            return False

        return True

    def exibir_mensagem_aviso(self, mensagem):
        # Exibe uma mensagem de aviso
        dialog = Gtk.MessageDialog(transient_for=self, flags=0, message_type=Gtk.MessageType.WARNING,
                                   buttons=Gtk.ButtonsType.OK, text=mensagem, )
        dialog.run()
        dialog.destroy()

    def on_delete_event(self, widget, event):
        return True


# Classe para representar um jogo
class Jogo:
    def __init__(self, nome, caminho, prefixo, argumentos, sufixo, compatibilidade, diretorio, mangohud, gamemode):
        self.nome = nome
        self.caminho = caminho
        self.argumentos = argumentos
        self.sufixo = sufixo
        self.compatibilidade = compatibilidade
        self.diretorio = diretorio  # Adiciona o diretório correspondente ao jogo
        self.mangohud = mangohud  # Adiciona o status do MangoHud
        self.gamemode = gamemode  # Adiciona o status do Game Mode
        self.prefixo = prefixo  # Adiciona o status do Game Mode


# Classe principal da aplicação
class JogoApp(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Faugus Launcher")
        self.set_default_size(640, 480)

        # Variável para armazenar o jogo em execução
        self.jogo_em_execucao = None
        # Variável para armazenar o botão de executar
        self.botao_executar = None

        # Cria o diretório se não existir e define como diretório de trabalho
        diretorio_faugus_launcher = os.path.expanduser("~/.config/faugus-launcher/")
        if not os.path.exists(diretorio_faugus_launcher):
            os.makedirs(diretorio_faugus_launcher)

        self.diretorio_trabalho = diretorio_faugus_launcher
        os.chdir(self.diretorio_trabalho)

        self.jogos = []
        self.listbox = Gtk.ListBox(selection_mode=Gtk.SelectionMode.NONE)
        self.carregar_jogos()

        # Cria o checkbox e o configura
        self.checkbox_close_after_launch = Gtk.CheckButton(label="Close after launching a game")
        # Define o estado inicial do checkbox como desmarcado
        self.checkbox_close_after_launch.set_active(False)
        # Carrega o estado do arquivo de configuração
        self.checkbox_close_after_launch.set_active(self.carregar_configuracao())
        # Conecta o sinal "toggled" do checkbox para chamar o método on_checkbox_toggled
        self.checkbox_close_after_launch.connect("toggled", self.on_checkbox_toggled)

        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)

        # Configuração da janela com uma lista e um botão de adicionar
        scrolled_window = Gtk.ScrolledWindow()
        scrolled_window.set_vexpand(True)
        scrolled_window.add(self.listbox)

        # Adiciona a lista de jogos
        box.pack_start(scrolled_window, True, True, 0)

        # Adiciona um alinhamento horizontal para centralizar o checkbox
        hbox = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
        hbox.pack_start(self.checkbox_close_after_launch, True, True, 0)

        # Adiciona o checkbox entre a lista de jogos e o botão Adicionar
        hbox_alignment = Gtk.Alignment()
        hbox_alignment.add(hbox)
        box.pack_start(hbox_alignment, False, False, 0)
        hbox.set_halign(Gtk.Align.CENTER)

        # Cria e configura o botão de adicionar
        self.btn_adicionar = Gtk.Button()
        self.btn_adicionar.set_image(Gtk.Image.new_from_icon_name("gtk-add", Gtk.IconSize.BUTTON))
        self.btn_adicionar.connect("clicked", self.on_btn_adicionar_clicked)

        # Adiciona o botão de adicionar após o checkbox
        box.pack_end(self.btn_adicionar, False, False, 0)

        self.add(box)
        self.show_all()

        # Conecta o sinal SIGCHLD para capturar o evento de fechamento do processo filho
        signal.signal(signal.SIGCHLD, self.on_child_process_closed)

    def carregar_configuracao(self):
        # Verifica se o arquivo de configuração existe e carrega o estado do checkbox
        config_file = os.path.join(self.diretorio_trabalho, 'config.ini')
        if os.path.exists(config_file):
            with open(config_file, 'r') as f:
                return f.read().strip() == 'close-onlaunch=true'  # Retorna True se o conteúdo for 'close-onlaunch=true', senão False
        else:
            # Se o arquivo não existir, cria um com o valor padrão e retorna False
            self.salvar_configuracao(False)
            return False

    def salvar_configuracao(self, estado_checkbox):
        # Define o valor a ser escrito no arquivo baseado no estado do checkbox
        valor = 'close-onlaunch=true' if estado_checkbox else 'close-onlaunch=false'
        # Salva o estado do checkbox no arquivo de configuração
        config_file = os.path.join(self.diretorio_trabalho, 'config.ini')
        with open(config_file, 'w') as f:
            f.write(valor)

    def on_checkbox_toggled(self, widget):
        estado_checkbox = widget.get_active()
        self.salvar_configuracao(estado_checkbox)

    def adicionar_item_lista(self, jogo):
        # Adiciona um item à lista de jogos na interface
        hbox = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)

        label_jogo = Gtk.Label.new(jogo.nome)
        hbox.pack_start(label_jogo, True, True, 0)

        btn_excluir = Gtk.Button()
        btn_excluir.set_image(Gtk.Image.new_from_icon_name("edit-delete-symbolic", Gtk.IconSize.BUTTON))
        btn_excluir.connect('clicked', self.on_btn_excluir_clicked, jogo)
        hbox.pack_start(btn_excluir, False, False, 0)

        btn_editar = Gtk.Button()
        btn_editar.set_image(Gtk.Image.new_from_icon_name("document-edit-symbolic", Gtk.IconSize.BUTTON))
        btn_editar.connect('clicked', self.on_btn_editar_clicked, jogo)
        hbox.pack_start(btn_editar, False, False, 0)

        btn_executar = Gtk.Button()
        btn_executar.set_image(Gtk.Image.new_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON))
        btn_executar.connect('clicked', self.on_btn_executar_clicked, jogo)
        hbox.pack_start(btn_executar, False, False, 0)

        # Define a largura fixa para o GtkBox
        hbox.set_size_request(600, -1)  # Largura fixa de 300 pixels, altura ajustável

        # Define a cor de fundo azul para o GtkBox
        # hbox.override_background_color(Gtk.StateFlags.NORMAL, Gdk.RGBA(0, 0, 1, 1))

        # Adiciona o item à lista
        listbox_row = Gtk.ListBoxRow()
        listbox_row.add(hbox)
        listbox_row.set_activatable(False)
        listbox_row.set_can_focus(False)
        listbox_row.set_selectable(False)
        self.listbox.add(listbox_row)

        # Centraliza horizontalmente o item na lista
        hbox.set_halign(Gtk.Align.CENTER)

        # Alinha o item ao topo da lista
        listbox_row.set_valign(Gtk.Align.START)

    def on_child_process_closed(self, signum, frame):
        # Este método será chamado quando um processo filho terminar
        if self.jogo_em_execucao and self.jogo_em_execucao.poll() is not None:
            # Se o jogo em execução foi encerrado, redefine o estado do botão de executar
            if isinstance(self.botao_executar.get_child(), Gtk.Image):
                image = self.botao_executar.get_child()
                image.set_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON)
            else:
                self.botao_executar.set_image(
                    Gtk.Image.new_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON))
            self.jogo_em_execucao = None

            # Reativa os outros botões "Executar"
            for row in self.listbox.get_children():
                hbox = row.get_child()
                btn_executar = hbox.get_children()[3]
                btn_executar.set_sensitive(True)

    def exibir_mensagem_aviso(self, mensagem):
        # Exibe uma mensagem de aviso
        dialog = Gtk.MessageDialog(transient_for=self, flags=0, message_type=Gtk.MessageType.WARNING,
                                   buttons=Gtk.ButtonsType.OK, text=mensagem, )
        dialog.run()
        dialog.destroy()

    # Alteração no método carregar_jogos
    def carregar_jogos(self):
        # Carrega jogos do arquivo para a lista
        try:
            with open("games.txt", "r") as arquivo:
                for linha in arquivo:
                    dados = linha.strip().split(";")
                    # Verifica se há pelo menos 7 campos na linha
                    if len(dados) >= 7:
                        # Extrai os primeiros 7 campos
                        nome, caminho, prefixo, argumentos, sufixo, compatibilidade, diretorio = dados[:7]
                        # Verifica se há campos adicionais para mangohud e gamemode
                        if len(dados) >= 9:
                            mangohud = dados[7]
                            gamemode = dados[8]
                        else:
                            mangohud = ""
                            gamemode = ""
                        jogo = Jogo(nome, caminho, prefixo, argumentos, sufixo, compatibilidade, diretorio, mangohud,
                                    gamemode)
                        self.jogos.append(jogo)
                        self.adicionar_item_lista(jogo)
                    else:
                        print(f"'{linha}'")
        except FileNotFoundError:
            pass

    # Alterações no método salvar_jogos
    def salvar_jogos(self):
        # Salva a lista de jogos no arquivo
        with open("games.txt", "w") as arquivo:
            for jogo in self.jogos:
                mangohud_value = "MANGOHUD=1" if jogo.mangohud else ""
                gamemode_value = "gamemoderun" if jogo.gamemode else ""
                linha = f"{jogo.nome};{jogo.caminho};{jogo.prefixo};{jogo.argumentos};{jogo.sufixo};{jogo.compatibilidade};{jogo.diretorio};{mangohud_value};{gamemode_value}\n"
                arquivo.write(linha)

    def on_btn_adicionar_clicked(self, widget):
        # Callback para o botão de adicionar jogo
        adicionar_jogo_dialog = AdicionarJogoDialog(self)
        adicionar_jogo_dialog.connect("response", self.on_dialog_response, adicionar_jogo_dialog)
        adicionar_jogo_dialog.show()
        adicionar_jogo_dialog.dropdown_menu.set_active(
            0)  # Aqui estamos definindo o primeiro item (índice 0) como ativo

    def on_dialog_response(self, dialog, response_id, adicionar_jogo_dialog):
        # Callback para a resposta da caixa de diálogo de adição/edição de jogo
        if response_id == Gtk.ResponseType.OK:
            if adicionar_jogo_dialog.validar_campos():
                nome_jogo = adicionar_jogo_dialog.nome_entry.get_text()
                caminho_jogo = adicionar_jogo_dialog.caminho_entry.get_text()
                argumentos_jogo = adicionar_jogo_dialog.argumentos_entry.get_text()
                sufixo_jogo = adicionar_jogo_dialog.sufixo_entry.get_text()
                compatibilidade_jogo = adicionar_jogo_dialog.dropdown_menu.get_active_text()
                diretorio_jogo = self.get_diretorio_compatibilidade(compatibilidade_jogo)
                # Grava o campo "Prefix"
                prefixo_jogo = adicionar_jogo_dialog.prefix_entry.get_text()

                # Monta a linha com os valores dos campos
                jogo_info = f"{nome_jogo};{caminho_jogo};{prefixo_jogo};{argumentos_jogo};{sufixo_jogo};{compatibilidade_jogo};{diretorio_jogo}"

                # Verifica se MangoHud está marcado
                mangohud = "MANGOHUD=1" if adicionar_jogo_dialog.mangohud_checkbox.get_active() else ""

                # Verifica se Game Mode está marcado
                gamemode = "gamemoderun" if adicionar_jogo_dialog.gamemode_checkbox.get_active() else ""

                # Adiciona MangoHud e Game Mode à linha
                jogo_info += f";{mangohud};{gamemode}\n"

                # Adiciona o jogo à lista e salva no arquivo
                with open("games.txt", "a") as arquivo:
                    arquivo.write(jogo_info)

                jogo = Jogo(nome_jogo, caminho_jogo, prefixo_jogo, argumentos_jogo, sufixo_jogo, compatibilidade_jogo,
                            diretorio_jogo, mangohud, gamemode)
                self.jogos.append(jogo)
                self.adicionar_item_lista(jogo)
                self.atualizar_lista()
            else:
                return True

        adicionar_jogo_dialog.destroy()

    def get_diretorio_compatibilidade(self, compatibilidade):
        # Função para obter o diretório correspondente ao item selecionado no dropdown
        if compatibilidade == "Proton Experimental":
            return "~/.steam/steam/steamapps/common/Proton - Experimental"
        else:
            return os.path.expanduser(
                f"~/.steam/steam/compatibilitytools.d/{compatibilidade}")  # elif compatibilidade == "Wine":  #    return "/usr/bin/wine64"

    def on_btn_excluir_clicked(self, widget, jogo):
        # Callback para o botão de excluir jogo
        confirmacao_dialog = ConfirmacaoDialog(self, "Are you sure?")
        response = confirmacao_dialog.run()

        if response == Gtk.ResponseType.YES:
            # Verifica se o checkbox "Also remove the prefix" está marcado
            if confirmacao_dialog.get_remove_prefix_state():
                # Obtém o prefixo do jogo
                prefixo_jogo = jogo.prefixo

                # Exclui a pasta correspondente ao prefixo do jogo, ignorando se não existir
                prefixo_path = os.path.expanduser(prefixo_jogo)
                try:
                    shutil.rmtree(prefixo_path)
                except FileNotFoundError:
                    pass

            # Remove o jogo da lista e salva no arquivo
            self.jogos.remove(jogo)
            self.salvar_jogos()
            self.atualizar_lista()

        confirmacao_dialog.destroy()

    # Alteração no método on_btn_editar_clicked
    def on_btn_editar_clicked(self, widget, jogo):
        # Callback para o botão de editar jogo
        editar_jogo_dialog = AdicionarJogoDialog(self)
        editar_jogo_dialog.connect("response", self.on_edit_dialog_response, editar_jogo_dialog, jogo)

        # Carregar os campos do jogo no diálogo de edição
        editar_jogo_dialog.nome_entry.set_text(jogo.nome)
        editar_jogo_dialog.caminho_entry.set_text(jogo.caminho)
        editar_jogo_dialog.prefix_entry.set_text(jogo.prefixo)  # Correção aqui
        editar_jogo_dialog.argumentos_entry.set_text(jogo.argumentos)
        editar_jogo_dialog.sufixo_entry.set_text(jogo.sufixo)

        texto_predefinido = jogo.compatibilidade
        modelo = editar_jogo_dialog.dropdown_menu.get_model()

        for i, row in enumerate(modelo):
            if row[0] == texto_predefinido:
                editar_jogo_dialog.dropdown_menu.set_active(i)
                break

        # Verificar o estado do mangohud e gamemode no arquivo jogos.txt
        mangohud_status = False  # Define como False por padrão
        gamemode_status = False  # Define como False por padrão
        with open("games.txt", "r") as arquivo:
            for linha in arquivo:
                campos = linha.strip().split(";")
                if len(campos) >= 9 and campos[0] == jogo.nome:
                    mangohud_status = campos[7] == "MANGOHUD=1"  # Verifica se o campo do mangohud está marcado
                    gamemode_status = campos[8] == "gamemoderun"  # Verifica se o campo do gamemode está marcado

        # Definir o estado dos checkboxes com base no status lido
        editar_jogo_dialog.mangohud_checkbox.set_active(mangohud_status)
        editar_jogo_dialog.gamemode_checkbox.set_active(gamemode_status)

        editar_jogo_dialog.show()

    def on_edit_dialog_response(self, dialog, response_id, editar_jogo_dialog, jogo):
        # Callback para a resposta da caixa de diálogo de edição de jogo
        if response_id == Gtk.ResponseType.OK:
            nome = editar_jogo_dialog.nome_entry.get_text()
            caminho = editar_jogo_dialog.caminho_entry.get_text()

            if not nome or not caminho:
                editar_jogo_dialog.exibir_mensagem_aviso("Title and Path need to be filled")
                return True

            # Atualiza todos os campos do objeto jogo
            jogo.nome = nome
            jogo.caminho = caminho
            jogo.prefixo = editar_jogo_dialog.prefix_entry.get_text()
            jogo.argumentos = editar_jogo_dialog.argumentos_entry.get_text()
            jogo.sufixo = editar_jogo_dialog.sufixo_entry.get_text()
            jogo.compatibilidade = editar_jogo_dialog.dropdown_menu.get_active_text()
            jogo.diretorio = self.get_diretorio_compatibilidade(jogo.compatibilidade)
            jogo.mangohud = editar_jogo_dialog.mangohud_checkbox.get_active()
            jogo.gamemode = editar_jogo_dialog.gamemode_checkbox.get_active()

            # Atualiza o arquivo jogos.txt com as informações do jogo editado
            self.salvar_jogos()

            self.atualizar_lista()

        editar_jogo_dialog.destroy()

    def on_btn_executar_clicked(self, widget, jogo):
        if self.jogo_em_execucao is None:
            # Inicia o jogo
            nome_jogo_formatado = re.sub(r'[^a-zA-Z0-9\s]', '', jogo.nome)
            nome_jogo_formatado = nome_jogo_formatado.replace(' ', '-')
            nome_jogo_formatado = '-'.join(nome_jogo_formatado.lower().split())

            argumentos_jogo = jogo.argumentos
            caminho_jogo = jogo.caminho
            prefixo_jogo = jogo.prefixo
            sufixo_jogo = jogo.sufixo
            compatibilidade_jogo = jogo.compatibilidade
            diretorio_jogo = jogo.diretorio
            mangohud_jogo = jogo.mangohud
            gamemode_jogo = jogo.gamemode

            comando = (f'{mangohud_jogo} '
                       f'WINEPREFIX={prefixo_jogo} '
                       f'GAMEID={nome_jogo_formatado} '
                       f'PROTONPATH=\'{os.path.expanduser(diretorio_jogo)}\' '
                       f'{argumentos_jogo} '
                       f'{gamemode_jogo} '
                       f'"/usr/bin/ulwgl-faugus" "{caminho_jogo}" "{sufixo_jogo}"')

            print(comando)

            # Verifica se o checkbox está marcado
            if self.checkbox_close_after_launch.get_active():
                # Executa o jogo em um novo processo e redireciona a saída para /dev/null
                subprocess.Popen(["/bin/bash", "-c", comando], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                import sys
                sys.exit()  # Encerra o processo do aplicativo completamente
            else:
                self.jogo_em_execucao = subprocess.Popen(["/bin/bash", "-c", comando])
                self.botao_executar = widget
                if isinstance(self.botao_executar.get_child(), Gtk.Image):
                    image = self.botao_executar.get_child()
                    image.set_from_icon_name("media-playback-stop-symbolic", Gtk.IconSize.BUTTON)
                else:
                    self.botao_executar.set_image(
                        Gtk.Image.new_from_icon_name("media-playback-stop-symbolic", Gtk.IconSize.BUTTON))

                # Desativa os outros botões "Executar"
                for row in self.listbox.get_children():
                    hbox = row.get_child()
                    btn_executar = hbox.get_children()[3]
                    if btn_executar != widget:  # Remover para desativar todos os botões
                        btn_executar.set_sensitive(False)

        else:
            # Interrompe o jogo em execução
            subprocess.run(
                "ls -l /proc/*/exe 2>/dev/null | grep -E 'wine(64)?-preloader|wineserver' | perl -pe 's;^.*/proc/(\d+)/exe.*$;$1;g;' | xargs -n 1 kill | killall -s9 winedevice.exe tee",
                shell=True)
            self.jogo_em_execucao.wait()  # Espera pelo processo ser encerrado completamente
            self.jogo_em_execucao = None
            if isinstance(self.botao_executar.get_child(), Gtk.Image):
                image = self.botao_executar.get_child()
                image.set_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON)
            else:
                self.botao_executar.set_image(
                    Gtk.Image.new_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON))

            # Reativa os outros botões "Executar"
            for row in self.listbox.get_children():
                hbox = row.get_child()
                btn_executar = hbox.get_children()[3]
                btn_executar.set_sensitive(True)

    def atualizar_lista(self):
        # Atualiza a lista de jogos na interface
        for row in self.listbox.get_children():
            self.listbox.remove(row)

        self.jogos.clear()

        self.carregar_jogos()
        self.show_all()


if __name__ == "__main__":
    # Instancia e inicia a aplicação Gtk
    app = JogoApp()
    app.connect("destroy", Gtk.main_quit)
    #app.set_type_hint(Gdk.WindowTypeHint.UTILITY)
    app.show_all()
    Gtk.main()
