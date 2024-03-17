#!/usr/bin/env python3

import os
import subprocess
import re
import gi
import sys
import shutil
import signal

# Importa os módulos necessários do Gtk
gi.require_version('Gtk', '3.0')
gi.require_version('Gdk', '3.0')
from gi.repository import Gtk, Gdk

# Classe para caixa de diálogo de confirmação
class ConfirmacaoDialog(Gtk.Dialog):
    def __init__(self, parent, mensagem):
        super().__init__(title="Confirmação", parent=parent, flags=0)
        self.set_decorated(False)
        self.set_resizable(False)
        self.set_default_size(300, 100)

        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        self.get_content_area().add(box)

        # Adiciona espaçamento e uma etiqueta com a mensagem de confirmação
        box.pack_start(Gtk.Label(), True, True, 0)
        label = Gtk.Label(label=mensagem)
        label.set_line_wrap(True)
        box.pack_start(label, True, True, 0)
        box.pack_start(Gtk.Label(), True, True, 0)

        # Adiciona botões para "Não" e "Sim"
        buttons_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        box.pack_start(buttons_box, True, True, 0)

        box.pack_start(Gtk.Label(), True, True, 0)

        btn_no = Gtk.Button()
        btn_no.add(Gtk.Image.new_from_icon_name("window-close-symbolic", Gtk.IconSize.BUTTON))
        btn_no.connect("clicked", lambda x: self.response(Gtk.ResponseType.NO))
        buttons_box.pack_start(btn_no, True, True, 0)

        btn_yes = Gtk.Button()
        btn_yes.add(Gtk.Image.new_from_icon_name("gtk-ok", Gtk.IconSize.BUTTON))
        btn_yes.connect("clicked", lambda x: self.response(Gtk.ResponseType.YES))
        buttons_box.pack_start(btn_yes, True, True, 0)

        # Exibe todos os elementos
        self.show_all()

# Classe para caixa de diálogo de adição/edição de jogo
class AdicionarJogoDialog(Gtk.Dialog):
    def __init__(self, parent):
        super().__init__(title="Adicionar/Editar Jogo", parent=parent)
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
        self.nome_label = Gtk.Label(label="Nome:")
        self.nome_entry = Gtk.Entry()

        self.caminho_label = Gtk.Label(label="Caminho:")
        self.caminho_entry = Gtk.Entry()
        self.procurar_button = Gtk.Button()
        self.procurar_button.set_image(Gtk.Image.new_from_icon_name("system-search", Gtk.IconSize.BUTTON))
        self.procurar_button.connect("clicked", self.on_procurar_clicked)
        
        # Adicionar o novo campo Prefix
        self.prefix_label = Gtk.Label(label="Prefix:")
        self.prefix_entry = Gtk.Entry()

        self.argumentos_label = Gtk.Label(label="Argumentos:")
        self.argumentos_entry = Gtk.Entry()

        self.sufixo_label = Gtk.Label(label="Sufixo:")
        self.sufixo_entry = Gtk.Entry()
        

        
        # Dropdown menu
        self.dropdown_label = Gtk.Label(label="Compatibilidade:")
        self.dropdown_menu = Gtk.ComboBoxText()
        self.dropdown_menu.connect("changed", self.on_dropdown_changed)

        self.populate_dropdown()

        # Checkboxes
        self.mangohud_checkbox = Gtk.CheckButton(label="MangoHud")
        self.gamemode_checkbox = Gtk.CheckButton(label="Game Mode")

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
        cancel_button.add(Gtk.Image.new_from_icon_name("window-close-symbolic", Gtk.IconSize.BUTTON))
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

        comando = (
            f'WINEPREFIX={prefixo_jogo} '
            f'{os.path.expanduser("/usr/bin/winetricks")} '
            
            #f'/usr/bin/winetricks'
            
        )
        
        subprocess.Popen(["/bin/bash", "-c", comando])
        
    def populate_dropdown(self):
        # Verifica se os diretórios existem e adiciona opções ao dropdown
        if os.path.exists(os.path.expanduser("~/.steam/steam/steamapps/common/Proton - Experimental")):
            self.dropdown_menu.append_text("Proton Experimental")

        compatibility_tools_dir = os.path.expanduser("~/.steam/steam/compatibilitytools.d/")
        if os.path.exists(compatibility_tools_dir):
            for item in os.listdir(compatibility_tools_dir):
                self.dropdown_menu.append_text(item)

        #if os.path.exists("/usr/bin/wine64"):
        #    self.dropdown_menu.append_text("Wine")
            
    def on_dropdown_changed(self, widget):
        # Este método será chamado sempre que houver uma mudança no dropdown
        pass

    def on_procurar_clicked(self, widget):
        # Callback para o botão de procurar
        dialog = Gtk.FileChooserDialog(
            title="Selecione o arquivo .exe",
            parent=self,
            action=Gtk.FileChooserAction.OPEN,
        )

        dialog.set_current_folder("/mnt/data/Games")
        dialog.add_buttons(
            Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL,
            Gtk.STOCK_OPEN, Gtk.ResponseType.OK
        )

        response = dialog.run()
        if response == Gtk.ResponseType.OK:
            self.caminho_entry.set_text(dialog.get_filename())

        dialog.destroy()

    def validar_campos(self):
        # Validação dos campos antes de adicionar/editar um jogo
        nome = self.nome_entry.get_text()
        caminho = self.caminho_entry.get_text()

        if not nome or not caminho:
            self.exibir_mensagem_aviso("Preencha os campos Nome e Caminho.")
            return False

        return True

    def exibir_mensagem_aviso(self, mensagem):
        # Exibe uma mensagem de aviso
        dialog = Gtk.MessageDialog(
            transient_for=self,
            flags=0,
            message_type=Gtk.MessageType.WARNING,
            buttons=Gtk.ButtonsType.OK,
            text=mensagem,
        )
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
        
        self.jogo_em_execucao = None  # Variável para armazenar o jogo em execução
        self.botao_executar = None  # Variável para armazenar o botão de executar
        
        # Cria o diretório se não existir e define como diretório de trabalho
        diretorio_faugus_launcher = os.path.expanduser("~/.config/faugus-launcher/")
        if not os.path.exists(diretorio_faugus_launcher):
            os.makedirs(diretorio_faugus_launcher)

        self.diretorio_trabalho = diretorio_faugus_launcher
        os.chdir(self.diretorio_trabalho)

        # Obtém o caminho absoluto para o diretório temporário do PyInstaller
        script_dir = os.path.dirname(os.path.realpath(__file__))

        # Obtém o caminho absoluto para o arquivo "ulwgl-faugus"
        ulwgl_run_path = os.path.join(script_dir, 'ulwgl-faugus')

        # Define o caminho de destino onde você deseja copiar a pasta ulwgl/bin
        destino_dir = os.path.expanduser('~/.config/faugus-launcher/')

        # Imprime o caminho de origem e destino
        # print(f"Caminho de origem: {ulwgl_dir}")
        print(f"Caminho de destino: {destino_dir}")

        # Verifica se a pasta de destino já existe
        if os.path.exists(os.path.join(destino_dir, 'ulwgl-faugus')):
            print("O arquivo ulwgl-faugus já existe no destino. Não é necessário copiar.")
        else:
            # Copia o arquivo ulwgl-faugus para o diretório de destino
            shutil.copy(ulwgl_run_path, destino_dir)
            print("Arquivo ulwgl-faugus copiado com sucesso!")

        self.jogos = []
        self.listbox = Gtk.ListBox(selection_mode=Gtk.SelectionMode.NONE)
        self.carregar_jogos()

        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)

        # Configuração da janela com uma lista e um botão de adicionar
        scrolled_window = Gtk.ScrolledWindow()
        scrolled_window.set_vexpand(True)
        scrolled_window.add(self.listbox)

        self.btn_adicionar = Gtk.Button()
        self.btn_adicionar.set_image(Gtk.Image.new_from_icon_name("list-add", Gtk.IconSize.BUTTON))
        self.btn_adicionar.connect("clicked", self.on_btn_adicionar_clicked)

        box.pack_start(scrolled_window, True, True, 0)
        box.pack_end(self.btn_adicionar, False, False, 0)

        self.add(box)
        self.show_all()
        
        # Conecta o sinal SIGCHLD para capturar o evento de fechamento do processo filho
        signal.signal(signal.SIGCHLD, self.on_child_process_closed)

    def on_child_process_closed(self, signum, frame):
        # Este método será chamado quando um processo filho terminar
        if self.jogo_em_execucao and self.jogo_em_execucao.poll() is not None:
            # Se o jogo em execução foi encerrado, redefine o estado do botão de executar
            if isinstance(self.botao_executar.get_child(), Gtk.Image):
                image = self.botao_executar.get_child()
                image.set_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON)
            else:
                self.botao_executar.set_image(Gtk.Image.new_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON))
            self.jogo_em_execucao = None

            # Reativa os outros botões "Executar"
            for row in self.listbox.get_children():
                hbox = row.get_child()
                btn_executar = hbox.get_children()[3]
                btn_executar.set_sensitive(True)

    def exibir_mensagem_aviso(self, mensagem):
        # Exibe uma mensagem de aviso
        dialog = Gtk.MessageDialog(
            transient_for=self,
            flags=0,
            message_type=Gtk.MessageType.WARNING,
            buttons=Gtk.ButtonsType.OK,
            text=mensagem,
        )
        dialog.run()
        dialog.destroy()

    # Alteração no método carregar_jogos
    def carregar_jogos(self):
        # Carrega jogos do arquivo para a lista
        try:
            with open("jogos.txt", "r") as arquivo:
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
                        jogo = Jogo(nome, caminho, prefixo, argumentos, sufixo, compatibilidade, diretorio, mangohud, gamemode)
                        self.jogos.append(jogo)
                        self.adicionar_item_lista(jogo)
                    else:
                        print(f"A linha '{linha}' não possui dados suficientes.")
        except FileNotFoundError:
            pass


    # Alterações no método salvar_jogos
    def salvar_jogos(self):
        # Salva a lista de jogos no arquivo
        with open("jogos.txt", "w") as arquivo:
            for jogo in self.jogos:
                mangohud_value = "MANGOHUD=1" if jogo.mangohud else ""
                gamemode_value = "gamemoderun" if jogo.gamemode else ""
                linha = f"{jogo.nome};{jogo.caminho};{jogo.prefixo};{jogo.argumentos};{jogo.sufixo};{jogo.compatibilidade};{jogo.diretorio};{mangohud_value};{gamemode_value}\n"
                arquivo.write(linha)



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

        listbox_row = Gtk.ListBoxRow()
        listbox_row.add(hbox)
        listbox_row.set_activatable(False)
        listbox_row.set_can_focus(False)
        listbox_row.set_selectable(False)
        self.listbox.add(listbox_row)

    def on_btn_adicionar_clicked(self, widget):
        # Callback para o botão de adicionar jogo
        adicionar_jogo_dialog = AdicionarJogoDialog(self)
        adicionar_jogo_dialog.connect("response", self.on_dialog_response, adicionar_jogo_dialog)
        adicionar_jogo_dialog.show()
        adicionar_jogo_dialog.dropdown_menu.set_active(0)  # Aqui estamos definindo o primeiro item (índice 0) como ativo

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
                with open("jogos.txt", "a") as arquivo:
                    arquivo.write(jogo_info)

                jogo = Jogo(nome_jogo, caminho_jogo, prefixo_jogo, argumentos_jogo, sufixo_jogo, compatibilidade_jogo, diretorio_jogo, mangohud, gamemode)
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
            return os.path.expanduser(f"~/.steam/steam/compatibilitytools.d/{compatibilidade}")
        #elif compatibilidade == "Wine":
        #    return "/usr/bin/wine64"


    def on_btn_excluir_clicked(self, widget, jogo):
        # Callback para o botão de excluir jogo
        confirmacao_dialog = ConfirmacaoDialog(self, "Tem certeza que deseja excluir este jogo?")
        response = confirmacao_dialog.run()

        if response == Gtk.ResponseType.YES:
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
        with open("jogos.txt", "r") as arquivo:
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
                editar_jogo_dialog.exibir_mensagem_aviso("Preencha os campos Nome e Caminho.")
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
            
            #f'WINEPREFIX={os.path.expanduser("~/.config/faugus-launcher/prefixes/")}{nome_jogo_formatado} '

            comando = (
                f'{mangohud_jogo} '
                f'WINEPREFIX={prefixo_jogo} '
                f'GAMEID={nome_jogo_formatado} '
                f'PROTONPATH=\'{os.path.expanduser(diretorio_jogo)}\' '
                f'{argumentos_jogo} '
                f'{gamemode_jogo} '
                f'{os.path.expanduser("~/.config/faugus-launcher/ulwgl-faugus")} "{caminho_jogo}" "{sufixo_jogo}"'
            )

            print(comando)

            self.jogo_em_execucao = subprocess.Popen(["/bin/bash", "-c", comando])
            self.botao_executar = widget
            if isinstance(self.botao_executar.get_child(), Gtk.Image):
                image = self.botao_executar.get_child()
                image.set_from_icon_name("media-playback-stop-symbolic", Gtk.IconSize.BUTTON)
            else:
                self.botao_executar.set_image(Gtk.Image.new_from_icon_name("media-playback-stop-symbolic", Gtk.IconSize.BUTTON))

            # Desativa os outros botões "Executar"
            for row in self.listbox.get_children():
                hbox = row.get_child()
                btn_executar = hbox.get_children()[3]
                if btn_executar != widget:
                    btn_executar.set_sensitive(False)
        else:
            # Interrompe o jogo em execução
            subprocess.run("ls -l /proc/*/exe 2>/dev/null | grep -E 'wine(64)?-preloader|wineserver' | perl -pe 's;^.*/proc/(\d+)/exe.*$;$1;g;' | xargs -n 1 kill | killall -s9 winedevice.exe tee", shell=True)
            self.jogo_em_execucao.wait()  # Espera pelo processo ser encerrado completamente
            self.jogo_em_execucao = None
            if isinstance(self.botao_executar.get_child(), Gtk.Image):
                image = self.botao_executar.get_child()
                image.set_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON)
            else:
                self.botao_executar.set_image(Gtk.Image.new_from_icon_name("media-playback-start-symbolic", Gtk.IconSize.BUTTON))

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
    app.show_all()
    Gtk.main()

