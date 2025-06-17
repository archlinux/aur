import gi
gi.require_version('Gtk', '3.0')
gi.require_version('Gdk', '3.0')
from gi.repository import Gtk, Gdk, GObject, Gio, GLib, GdkPixbuf

import os
import subprocess
import threading
import json
from pathlib import Path
import shutil
import mimetypes

class FileExplorer(Gtk.Window):
    def __init__(self):
        super().__init__(title="Explorador de Archivos")
        self.set_default_size(1000, 700)
        self.set_position(Gtk.WindowPosition.CENTER)
        
        # Variables de estado
        self.current_path = str(Path.home())
        self.clipboard_path = None
        self.clipboard_operation = None  # 'copy' o 'cut'
        
        # Configurar la ventana principal
        self.setup_ui()
        self.load_directory(self.current_path)
        
        # Conectar señales
        self.connect("destroy", Gtk.main_quit)
        
    def setup_ui(self):
        """Configurar la interfaz de usuario"""
        # Contenedor principal
        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        self.add(main_box)
        
        # Barra de herramientas
        self.create_toolbar(main_box)
        
        # Panel principal con división
        paned = Gtk.Paned(orientation=Gtk.Orientation.HORIZONTAL)
        main_box.pack_start(paned, True, True, 0)
        
        # Panel lateral (sidebar)
        self.create_sidebar(paned)
        
        # Panel principal de archivos
        self.create_file_panel(paned)
        
        # Barra de estado
        self.create_statusbar(main_box)
        
        # Panel de control de sistema (Wi-Fi, volumen, brillo)
        #self.create_system_panel(main_box)
        
    def create_toolbar(self, container):
        """Crear barra de herramientas"""
        toolbar = Gtk.Toolbar()
        toolbar.set_style(Gtk.ToolbarStyle.ICONS)
        container.pack_start(toolbar, False, False, 0)
        
        # Botón Atrás
        back_btn = Gtk.ToolButton(stock_id=Gtk.STOCK_GO_BACK)
        back_btn.set_tooltip_text("Atrás")
        back_btn.connect("clicked", self.go_back)
        toolbar.insert(back_btn, -1)
        
        # Botón Adelante
        forward_btn = Gtk.ToolButton(stock_id=Gtk.STOCK_GO_FORWARD)
        forward_btn.set_tooltip_text("Adelante")
        forward_btn.connect("clicked", self.go_forward)
        toolbar.insert(forward_btn, -1)
        
        # Botón Subir
        up_btn = Gtk.ToolButton(stock_id=Gtk.STOCK_GO_UP)
        up_btn.set_tooltip_text("Directorio superior")
        up_btn.connect("clicked", self.go_up)
        toolbar.insert(up_btn, -1)
        
        # Separador
        toolbar.insert(Gtk.SeparatorToolItem(), -1)
        
        # Botón Home
        home_btn = Gtk.ToolButton(stock_id=Gtk.STOCK_HOME)
        home_btn.set_tooltip_text("Inicio")
        home_btn.connect("clicked", self.go_home)
        toolbar.insert(home_btn, -1)
        
        # Entrada de ruta
        self.path_entry = Gtk.Entry()
        self.path_entry.set_text(self.current_path)
        self.path_entry.connect("activate", self.on_path_entry_activate)
        
        path_item = Gtk.ToolItem()
        path_item.set_expand(True)
        path_item.add(self.path_entry)
        toolbar.insert(path_item, -1)
        
        # Botón Actualizar
        refresh_btn = Gtk.ToolButton(stock_id=Gtk.STOCK_REFRESH)
        refresh_btn.set_tooltip_text("Actualizar")
        refresh_btn.connect("clicked", self.refresh_directory)
        toolbar.insert(refresh_btn, -1)
        # Separador
        toolbar.insert(Gtk.SeparatorToolItem(), -1)

        # Botón Añadir
        add_btn = Gtk.ToolButton(stock_id=Gtk.STOCK_ADD)
        add_btn.set_tooltip_text("Añadir archivo o carpeta")
        add_btn.connect("clicked", self.show_add_dialog)
        toolbar.insert(add_btn, -1)
        
    def create_sidebar(self, paned):
        """Crear panel lateral con lugares favoritos y controles"""
        sidebar_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        sidebar_box.set_size_request(250, -1)  # Hacer más ancho

        scrolled_sidebar = Gtk.ScrolledWindow()
        scrolled_sidebar.set_policy(Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC)

        main_sidebar_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        main_sidebar_box.set_margin_top(5)
        main_sidebar_box.set_margin_bottom(5)
        main_sidebar_box.set_margin_left(5)
        main_sidebar_box.set_margin_right(5)

        # SECCIÓN LUGARES
        self.create_places_section(main_sidebar_box)

        # SECCIÓN CONTROL DEL SISTEMA
        self.create_system_control_section(main_sidebar_box)

        # SECCIÓN APLICACIONES
        self.create_applications_section(main_sidebar_box)

        scrolled_sidebar.add(main_sidebar_box)
        sidebar_box.pack_start(scrolled_sidebar, True, True, 0)

        paned.pack1(sidebar_box, False, False)
        
    def create_file_panel(self, paned):
        """Crear panel principal de archivos"""
        file_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        
        # Vista de archivos
        self.file_store = Gtk.ListStore(GdkPixbuf.Pixbuf, str, str, str)  # Icono, Nombre, Tipo, Ruta
        self.file_view = Gtk.TreeView(model=self.file_store)
        
        # Columnas
        # Columna de icono
        icon_renderer = Gtk.CellRendererPixbuf()
        icon_column = Gtk.TreeViewColumn("", icon_renderer, pixbuf=0)
        icon_column.set_sizing(Gtk.TreeViewColumnSizing.FIXED)
        icon_column.set_fixed_width(32)
        self.file_view.append_column(icon_column)
        
        # Columna de nombre
        name_renderer = Gtk.CellRendererText()
        name_column = Gtk.TreeViewColumn("Nombre", name_renderer, text=1)
        name_column.set_resizable(True)
        name_column.set_expand(True)
        self.file_view.append_column(name_column)
        
        # Columna de tipo
        type_renderer = Gtk.CellRendererText()
        type_column = Gtk.TreeViewColumn("Tipo", type_renderer, text=2)
        type_column.set_resizable(True)
        self.file_view.append_column(type_column)
        
        # Conectar señales
        self.file_view.connect("row-activated", self.on_file_activated)
        self.file_view.connect("button-press-event", self.on_file_button_press)
        
        # Scroll para la vista de archivos
        scrolled_files = Gtk.ScrolledWindow()
        scrolled_files.set_policy(Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC)
        scrolled_files.add(self.file_view)
        
        file_box.pack_start(scrolled_files, True, True, 0)
        
        paned.pack2(file_box, True, False)
        
    def create_statusbar(self, container):
        """Crear barra de estado"""
        self.statusbar = Gtk.Statusbar()
        self.statusbar_context = self.statusbar.get_context_id("main")
        container.pack_start(self.statusbar, False, False, 0)
        
    def create_system_panel(self, container):
        """Crear panel de control del sistema"""
        system_frame = Gtk.Frame(label="Control del Sistema")
        system_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        system_box.set_margin_top(5)
        system_box.set_margin_bottom(5)
        system_box.set_margin_left(10)
        system_box.set_margin_right(10)
        
        # Controles de Wi-Fi
        wifi_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        wifi_label = Gtk.Label("Wi-Fi")
        wifi_box.pack_start(wifi_label, False, False, 0)
        
        wifi_btn_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=5)
        self.wifi_scan_btn = Gtk.Button(label="Escanear")
        self.wifi_scan_btn.connect("clicked", self.scan_wifi)
        wifi_btn_box.pack_start(self.wifi_scan_btn, False, False, 0)
        
        self.wifi_toggle_btn = Gtk.Button(label="On/Off")
        self.wifi_toggle_btn.connect("clicked", self.toggle_wifi)
        wifi_btn_box.pack_start(self.wifi_toggle_btn, False, False, 0)
        
        wifi_box.pack_start(wifi_btn_box, False, False, 0)
        system_box.pack_start(wifi_box, False, False, 0)
        
        # Controles de volumen
        volume_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        volume_label = Gtk.Label("Volumen")
        volume_box.pack_start(volume_label, False, False, 0)
        
        volume_scale = Gtk.Scale(orientation=Gtk.Orientation.HORIZONTAL)
        volume_scale.set_range(0, 100)
        volume_scale.set_value(50)
        volume_scale.connect("value-changed", self.on_volume_changed)
        volume_box.pack_start(volume_scale, False, False, 0)
        
        system_box.pack_start(volume_box, True, True, 0)
        
        # Controles de brillo
        brightness_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        brightness_label = Gtk.Label("Brillo")
        brightness_box.pack_start(brightness_label, False, False, 0)
        
        brightness_scale = Gtk.Scale(orientation=Gtk.Orientation.HORIZONTAL)
        brightness_scale.set_range(1, 100)
        brightness_scale.set_value(50)
        brightness_scale.connect("value-changed", self.on_brightness_changed)
        brightness_box.pack_start(brightness_scale, False, False, 0)
        
        system_box.pack_start(brightness_box, True, True, 0)
        
        system_frame.add(system_box)
        container.pack_start(system_frame, False, False, 0)
        
    def populate_places(self):
        """Poblar el panel lateral con lugares comunes"""
        places = [
            ("Inicio", str(Path.home())),
            ("Escritorio", str(Path.home() / "Desktop")),
            ("Documentos", str(Path.home() / "Documents")),
            ("Descargas", str(Path.home() / "Downloads")),
            ("Imágenes", str(Path.home() / "Pictures")),
            ("Música", str(Path.home() / "Music")),
            ("Vídeos", str(Path.home() / "Videos")),
            ("Raíz", "/"),
        ]
        
        for name, path in places:
            if os.path.exists(path):
                self.places_store.append([name, path])
                
    def load_directory(self, path):
        """Cargar directorio en la vista principal"""
        try:
            if not os.path.exists(path) or not os.path.isdir(path):
                self.show_error("El directorio no existe: " + path)
                return
                
            self.current_path = path
            self.path_entry.set_text(path)
            self.file_store.clear()
            
            # Obtener lista de archivos
            try:
                entries = os.listdir(path)
                entries.sort(key=lambda x: (not os.path.isdir(os.path.join(path, x)), x.lower()))
            except PermissionError:
                self.show_error("Sin permisos para acceder al directorio")
                return
                
            # Añadir cada entrada
            for entry in entries:
                if entry.startswith('.'):  # Omitir archivos ocultos por defecto
                    continue
                    
                full_path = os.path.join(path, entry)
                
                try:
                    if os.path.isdir(full_path):
                        icon = self.get_folder_icon()
                        file_type = "Carpeta"
                    else:
                        icon = self.get_file_icon(full_path)
                        file_type = self.get_file_type(full_path)
                        
                    self.file_store.append([icon, entry, file_type, full_path])
                except (OSError, IOError):
                    continue
                    
            # Actualizar barra de estado
            count = len(self.file_store)
            self.statusbar.push(self.statusbar_context, f"{count} elementos en {path}")
            
        except Exception as e:
            self.show_error(f"Error al cargar directorio: {str(e)}")
            
    def get_folder_icon(self):
        """Obtener icono para carpetas"""
        try:
            icon_theme = Gtk.IconTheme.get_default()
            icon_info = icon_theme.lookup_icon("folder", 24, 0)
            if icon_info:
                return icon_info.load_icon()
        except:
            pass
        return None
        
    def get_file_icon(self, filepath):
        """Obtener icono para archivos"""
        try:
            icon_theme = Gtk.IconTheme.get_default()
            
            # Obtener tipo MIME
            mime_type, _ = mimetypes.guess_type(filepath)
            
            if mime_type:
                if mime_type.startswith('image/'):
                    icon_name = "image-x-generic"
                elif mime_type.startswith('video/'):
                    icon_name = "video-x-generic"
                elif mime_type.startswith('audio/'):
                    icon_name = "audio-x-generic"
                elif mime_type.startswith('text/'):
                    icon_name = "text-x-generic"
                else:
                    icon_name = "text-x-generic"
            else:
                icon_name = "text-x-generic"
                
            icon_info = icon_theme.lookup_icon(icon_name, 24, 0)
            if icon_info:
                return icon_info.load_icon()
        except:
            pass
        return None
        
    def get_file_type(self, filepath):
        """Obtener tipo de archivo"""
        mime_type, _ = mimetypes.guess_type(filepath)
        if mime_type:
            return mime_type
        return "Archivo"
        
    def on_file_activated(self, treeview, path, column):
        """Manejar doble clic en archivo/carpeta"""
        model = treeview.get_model()
        iter = model.get_iter(path)
        file_path = model.get_value(iter, 3)
        
        if os.path.isdir(file_path):
            self.load_directory(file_path)
        else:
            self.open_file(file_path)
            
    def on_file_button_press(self, widget, event):
        """Manejar clic derecho en archivos"""
        if event.button == 3:  # Clic derecho
            self.show_context_menu(event)
            return True
        return False
        
    def show_context_menu(self, event):
        """Mostrar menú contextual"""
        menu = Gtk.Menu()
        
        # Obtener archivo seleccionado
        selection = self.file_view.get_selection()
        model, iter = selection.get_selected()
        
        if iter:
            file_path = model.get_value(iter, 3)
            
            # Abrir
            open_item = Gtk.MenuItem(label="Abrir")
            open_item.connect("activate", lambda x: self.open_file(file_path))
            menu.append(open_item)
            
            menu.append(Gtk.SeparatorMenuItem())
            
            # Copiar
            copy_item = Gtk.MenuItem(label="Copiar")
            copy_item.connect("activate", lambda x: self.copy_file(file_path))
            menu.append(copy_item)
            
            # Cortar
            cut_item = Gtk.MenuItem(label="Cortar")
            cut_item.connect("activate", lambda x: self.cut_file(file_path))
            menu.append(cut_item)
            
            # Pegar (si hay algo en el clipboard)
            if self.clipboard_path:
                paste_item = Gtk.MenuItem(label="Pegar")
                paste_item.connect("activate", lambda x: self.paste_file())
                menu.append(paste_item)
                
            menu.append(Gtk.SeparatorMenuItem())
            
            # Eliminar
            delete_item = Gtk.MenuItem(label="Eliminar")
            delete_item.connect("activate", lambda x: self.delete_file(file_path))
            menu.append(delete_item)
            
            # Renombrar
            rename_item = Gtk.MenuItem(label="Renombrar")
            rename_item.connect("activate", lambda x: self.rename_file(file_path))
            menu.append(rename_item)
            
        menu.show_all()
        menu.popup(None, None, None, None, event.button, event.time)
        
    def open_file(self, filepath):
        """Abrir archivo con la aplicación predeterminada"""
        try:
            if os.name == 'posix':  # Linux/Unix
                subprocess.Popen(['xdg-open', filepath])
            elif os.name == 'nt':  # Windows
                os.startfile(filepath)
        except Exception as e:
            self.show_error(f"Error al abrir archivo: {str(e)}")
            
    def copy_file(self, filepath):
        """Copiar archivo al clipboard"""
        self.clipboard_path = filepath
        self.clipboard_operation = 'copy'
        self.statusbar.push(self.statusbar_context, f"Copiado: {os.path.basename(filepath)}")
        
    def cut_file(self, filepath):
        """Cortar archivo al clipboard"""
        self.clipboard_path = filepath
        self.clipboard_operation = 'cut'
        self.statusbar.push(self.statusbar_context, f"Cortado: {os.path.basename(filepath)}")
        
    def paste_file(self):
        """Pegar archivo desde clipboard"""
        if not self.clipboard_path:
            return
            
        try:
            source = self.clipboard_path
            filename = os.path.basename(source)
            destination = os.path.join(self.current_path, filename)
            
            if self.clipboard_operation == 'copy':
                if os.path.isdir(source):
                    shutil.copytree(source, destination)
                else:
                    shutil.copy2(source, destination)
            elif self.clipboard_operation == 'cut':
                shutil.move(source, destination)
                self.clipboard_path = None
                self.clipboard_operation = None
                
            self.refresh_directory(None)
            self.statusbar.push(self.statusbar_context, f"Pegado: {filename}")
            
        except Exception as e:
            self.show_error(f"Error al pegar: {str(e)}")
            
    def delete_file(self, filepath):
        """Eliminar archivo"""
        dialog = Gtk.MessageDialog(
            transient_for=self,
            flags=0,
            message_type=Gtk.MessageType.QUESTION,
            buttons=Gtk.ButtonsType.YES_NO,
            text=f"¿Eliminar {os.path.basename(filepath)}?"
        )
        
        response = dialog.run()
        dialog.destroy()
        
        if response == Gtk.ResponseType.YES:
            try:
                if os.path.isdir(filepath):
                    shutil.rmtree(filepath)
                else:
                    os.remove(filepath)
                self.refresh_directory(None)
                self.statusbar.push(self.statusbar_context, f"Eliminado: {os.path.basename(filepath)}")
            except Exception as e:
                self.show_error(f"Error al eliminar: {str(e)}")
                
    def rename_file(self, filepath):
        """Renombrar archivo"""
        dialog = Gtk.Dialog(
            title="Renombrar",
            transient_for=self,
            flags=0
        )
        dialog.add_buttons(
            Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL,
            Gtk.STOCK_OK, Gtk.ResponseType.OK
        )
        
        box = dialog.get_content_area()
        label = Gtk.Label("Nuevo nombre:")
        entry = Gtk.Entry()
        entry.set_text(os.path.basename(filepath))
        
        box.pack_start(label, False, False, 0)
        box.pack_start(entry, False, False, 0)
        box.show_all()
        
        response = dialog.run()
        new_name = entry.get_text()
        dialog.destroy()
        
        if response == Gtk.ResponseType.OK and new_name:
            try:
                new_path = os.path.join(os.path.dirname(filepath), new_name)
                os.rename(filepath, new_path)
                self.refresh_directory(None)
                self.statusbar.push(self.statusbar_context, f"Renombrado a: {new_name}")
            except Exception as e:
                self.show_error(f"Error al renombrar: {str(e)}")
                
    def on_place_selected(self, selection):
        """Manejar selección en el panel lateral"""
        model, iter = selection.get_selected()
        if iter:
            path = model.get_value(iter, 1)
            self.load_directory(path)
            
    def on_path_entry_activate(self, entry):
        """Manejar entrada de ruta manual"""
        path = entry.get_text()
        self.load_directory(path)
        
    def go_back(self, button):
        """Ir al directorio anterior"""
        # Implementar historial si es necesario
        pass
        
    def go_forward(self, button):
        """Ir al directorio siguiente"""
        # Implementar historial si es necesario
        pass
        
    def go_up(self, button):
        """Ir al directorio padre"""
        parent = os.path.dirname(self.current_path)
        if parent != self.current_path:
            self.load_directory(parent)
            
    def go_home(self, button):
        """Ir al directorio home"""
        self.load_directory(str(Path.home()))
        
    def refresh_directory(self, button):
        """Actualizar directorio actual"""
        self.load_directory(self.current_path)
        
    # Funciones del sistema
    def scan_wifi(self, button):
        """Escanear redes Wi-Fi"""
        def scan_thread():
            try:
                result = subprocess.run(['nmcli', 'dev', 'wifi', 'list'], 
                                      capture_output=True, text=True)
                GLib.idle_add(self.show_wifi_networks, result.stdout)
            except Exception as e:
                GLib.idle_add(self.show_error, f"Error al escanear Wi-Fi: {str(e)}")
                
        threading.Thread(target=scan_thread, daemon=True).start()
        
    def show_wifi_networks(self, networks_text):
        """Mostrar redes Wi-Fi disponibles"""
        dialog = Gtk.Dialog(
            title="Redes Wi-Fi",
            transient_for=self,
            flags=0
        )
        dialog.add_button(Gtk.STOCK_CLOSE, Gtk.ResponseType.CLOSE)
        dialog.set_default_size(600, 400)
        
        box = dialog.get_content_area()
        
        scrolled = Gtk.ScrolledWindow()
        scrolled.set_policy(Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC)
        
        textview = Gtk.TextView()
        textview.set_editable(False)
        textbuffer = textview.get_buffer()
        textbuffer.set_text(networks_text)
        
        scrolled.add(textview)
        box.pack_start(scrolled, True, True, 0)
        box.show_all()
        
        dialog.run()
        dialog.destroy()
        
    def toggle_wifi(self, button):
        """Encender/apagar Wi-Fi"""
        try:
            subprocess.run(['nmcli', 'radio', 'wifi', 'on'], check=True)
            self.statusbar.push(self.statusbar_context, "Wi-Fi activado")
        except Exception as e:
            self.show_error(f"Error al controlar Wi-Fi: {str(e)}")
            
    def on_volume_changed(self, scale):
        """Cambiar volumen"""
        volume = int(scale.get_value())
        try:
            subprocess.run(['pactl', 'set-sink-volume', '@DEFAULT_SINK@', f'{volume}%'], 
                            check=True)
        except Exception as e:
            print(f"Error al cambiar volumen: {e}")
            
    def on_brightness_changed(self, scale):
        """Cambiar brillo"""
        brightness = int(scale.get_value())
        try:
            # Intentar con xbacklight
            subprocess.run(['xbacklight', '-set', str(brightness)], check=True)
        except:
            try:
                # Alternativa con brightnessctl
                subprocess.run(['brightnessctl', 'set', f'{brightness}%'], check=True)
            except Exception as e:
                print(f"Error al cambiar brillo: {e}")
                
    def show_error(self, message):
        """Mostrar diálogo de error"""
        dialog = Gtk.MessageDialog(
            transient_for=self,
            flags=0,
            message_type=Gtk.MessageType.ERROR,
            buttons=Gtk.ButtonsType.OK,
            text=message
        )
        dialog.run()
        dialog.destroy()
    def show_add_dialog(self, button):
        """Mostrar diálogo para añadir nuevo archivo o carpeta"""
        dialog = Gtk.Dialog(
            title="Añadir nuevo",
            transient_for=self,
            flags=0
        )
        dialog.add_buttons(
            Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL,
            Gtk.STOCK_OK, Gtk.ResponseType.OK
        )

        box = dialog.get_content_area()
        box.set_spacing(10)
        box.set_margin_top(10)
        box.set_margin_bottom(10)
        box.set_margin_left(10)
        box.set_margin_right(10)

        # Tipo de elemento a crear
        type_label = Gtk.Label("¿Qué deseas crear?")
        box.pack_start(type_label, False, False, 0)

        # Radio buttons para seleccionar tipo
        folder_radio = Gtk.RadioButton.new_with_label_from_widget(None, "Carpeta")
        file_radio = Gtk.RadioButton.new_with_label_from_widget(folder_radio, "Archivo")

        box.pack_start(folder_radio, False, False, 0)
        box.pack_start(file_radio, False, False, 0)

        # Entrada de nombre
        name_label = Gtk.Label("Nombre:")
        name_entry = Gtk.Entry()

        box.pack_start(name_label, False, False, 0)
        box.pack_start(name_entry, False, False, 0)

        box.show_all()

        response = dialog.run()
        name = name_entry.get_text().strip()
        is_folder = folder_radio.get_active()

        dialog.destroy()

        if response == Gtk.ResponseType.OK and name:
            self.create_new_item(name, is_folder)
    def create_new_item(self, name, is_folder):
        """Crear nuevo archivo o carpeta"""
        try:
            new_path = os.path.join(self.current_path, name)
            
            if os.path.exists(new_path):
                self.show_error(f"Ya existe un elemento con el nombre '{name}'")
                return
                
            if is_folder:
                os.makedirs(new_path)
                self.statusbar.push(self.statusbar_context, f"Carpeta creada: {name}")
            else:
                with open(new_path, 'w') as f:
                    f.write("")  # Crear archivo vacío
                self.statusbar.push(self.statusbar_context, f"Archivo creado: {name}")
                
            self.refresh_directory(None)
            
        except Exception as e:
            self.show_error(f"Error al crear: {str(e)}")
    def create_places_section(self, container):
        """Crear sección de lugares"""
        places_frame = Gtk.Frame()
        places_frame.set_label("Lugares")
        places_frame.set_label_align(0.5, 0.5)

        places_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        places_box.set_margin_top(5)
        places_box.set_margin_bottom(5)
        places_box.set_margin_left(5)
        places_box.set_margin_right(5)

        # Lista de lugares
        self.places_store = Gtk.ListStore(str, str)
        self.places_view = Gtk.TreeView(model=self.places_store)

        renderer = Gtk.CellRendererText()
        column = Gtk.TreeViewColumn("Lugar", renderer, text=0)
        self.places_view.append_column(column)
        self.places_view.set_headers_visible(False)

        selection = self.places_view.get_selection()
        selection.connect("changed", self.on_place_selected)

        places_box.pack_start(self.places_view, True, True, 0)
        self.populate_places()

        places_frame.add(places_box)
        container.pack_start(places_frame, False, False, 0)
    def create_system_control_section(self, container):
        """Crear sección de control del sistema"""
        system_frame = Gtk.Frame()
        system_frame.set_label("Control del Sistema")
        system_frame.set_label_align(0.5, 0.5)

        system_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=8)
        system_box.set_margin_top(5)
        system_box.set_margin_bottom(5)
        system_box.set_margin_left(5)
        system_box.set_margin_right(5)

        # Wi-Fi
        wifi_expander = Gtk.Expander(label="Wi-Fi")
        wifi_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)

        wifi_btn_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=5)
        self.wifi_scan_btn = Gtk.Button(label="Escanear")
        self.wifi_scan_btn.connect("clicked", self.scan_wifi)
        self.wifi_toggle_btn = Gtk.Button(label="On/Off")
        self.wifi_toggle_btn.connect("clicked", self.toggle_wifi)

        wifi_btn_box.pack_start(self.wifi_scan_btn, True, True, 0)
        wifi_btn_box.pack_start(self.wifi_toggle_btn, True, True, 0)
        wifi_box.pack_start(wifi_btn_box, False, False, 0)

        wifi_expander.add(wifi_box)
        system_box.pack_start(wifi_expander, False, False, 0)

        # Bluetooth
        bluetooth_expander = Gtk.Expander(label="Bluetooth")
        bluetooth_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)

        bluetooth_btn_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=5)
        self.bluetooth_scan_btn = Gtk.Button(label="Escanear")
        self.bluetooth_scan_btn.connect("clicked", self.scan_bluetooth)
        self.bluetooth_toggle_btn = Gtk.Button(label="On/Off")
        self.bluetooth_toggle_btn.connect("clicked", self.toggle_bluetooth)

        bluetooth_btn_box.pack_start(self.bluetooth_scan_btn, True, True, 0)
        bluetooth_btn_box.pack_start(self.bluetooth_toggle_btn, True, True, 0)
        bluetooth_box.pack_start(bluetooth_btn_box, False, False, 0)

        bluetooth_expander.add(bluetooth_box)
        system_box.pack_start(bluetooth_expander, False, False, 0)

        # Volumen
        volume_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        volume_label = Gtk.Label("Volumen")
        volume_scale = Gtk.Scale(orientation=Gtk.Orientation.HORIZONTAL)
        volume_scale.set_range(0, 100)
        volume_scale.set_value(50)
        volume_scale.connect("value-changed", self.on_volume_changed)

        volume_box.pack_start(volume_label, False, False, 0)
        volume_box.pack_start(volume_scale, False, False, 0)
        system_box.pack_start(volume_box, False, False, 0)

        # Brillo
        brightness_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        brightness_label = Gtk.Label("Brillo")
        brightness_scale = Gtk.Scale(orientation=Gtk.Orientation.HORIZONTAL)
        brightness_scale.set_range(1, 100)
        brightness_scale.set_value(50)
        brightness_scale.connect("value-changed", self.on_brightness_changed)

        brightness_box.pack_start(brightness_label, False, False, 0)
        brightness_box.pack_start(brightness_scale, False, False, 0)
        system_box.pack_start(brightness_box, False, False, 0)

        system_frame.add(system_box)
        container.pack_start(system_frame, False, False, 0)
    def create_applications_section(self, container):
        """Crear sección de aplicaciones esenciales"""
        apps_frame = Gtk.Frame()
        apps_frame.set_label("Aplicaciones")
        apps_frame.set_label_align(0.5, 0.5)

        apps_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        apps_box.set_margin_top(5)
        apps_box.set_margin_bottom(5)
        apps_box.set_margin_left(5)
        apps_box.set_margin_right(5)

        # Lista de aplicaciones esenciales
        apps = [
            ("Firefox", "firefox"),
            ("Chrome", "google-chrome"),
            ("Terminal", "gnome-terminal"),
            ("Editor de Texto", "gedit"),
            ("Calculadora", "gnome-calculator"),
            ("Centro de Software", "gnome-software"),
        ]

        for app_name, command in apps:
            app_btn = Gtk.Button(label=app_name)
            app_btn.connect("clicked", lambda btn, cmd=command: self.launch_application(cmd))
            apps_box.pack_start(app_btn, False, False, 0)

        apps_frame.add(apps_box)
        container.pack_start(apps_frame, False, False, 0)
    def scan_bluetooth(self, button):
        """Escanear dispositivos Bluetooth"""
        def scan_thread():
            try:
                result = subprocess.run(['bluetoothctl', 'scan', 'on'], 
                                        capture_output=True, text=True, timeout=5)
                # Obtener dispositivos
                devices_result = subprocess.run(['bluetoothctl', 'devices'], 
                                                capture_output=True, text=True)
                GLib.idle_add(self.show_bluetooth_devices, devices_result.stdout)
            except Exception as e:
                GLib.idle_add(self.show_error, f"Error al escanear Bluetooth: {str(e)}")

        threading.Thread(target=scan_thread, daemon=True).start()

    def show_bluetooth_devices(self, devices_text):
        """Mostrar dispositivos Bluetooth disponibles"""
        dialog = Gtk.Dialog(
            title="Dispositivos Bluetooth",
            transient_for=self,
            flags=0
        )
        dialog.add_button(Gtk.STOCK_CLOSE, Gtk.ResponseType.CLOSE)
        dialog.set_default_size(500, 300)

        box = dialog.get_content_area()

        scrolled = Gtk.ScrolledWindow()
        scrolled.set_policy(Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC)

        textview = Gtk.TextView()
        textview.set_editable(False)
        textbuffer = textview.get_buffer()
        textbuffer.set_text(devices_text)

        scrolled.add(textview)
        box.pack_start(scrolled, True, True, 0)
        box.show_all()

        dialog.run()
        dialog.destroy()

    def toggle_bluetooth(self, button):
        """Encender/apagar Bluetooth"""
        try:
            subprocess.run(['bluetoothctl', 'power', 'on'], check=True)
            self.statusbar.push(self.statusbar_context, "Bluetooth activado")
        except Exception as e:
            self.show_error(f"Error al controlar Bluetooth: {str(e)}")

    def launch_application(self, command):
        """Lanzar aplicación"""
        try:
            subprocess.Popen([command], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            self.statusbar.push(self.statusbar_context, f"Abriendo {command}...")
        except Exception as e:
            self.show_error(f"Error al abrir aplicación: {str(e)}")


def main():
    """Función principal"""
    app = FileExplorer()
    app.show_all()
    Gtk.main()

if __name__ == "__main__":
    main()