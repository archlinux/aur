// Help text for gtk2adw, in Pango markup. Keep in step with README.md / README.ru.md.

// Russian when the first preferred UI language (LANGUAGE, LC_ALL, LC_MESSAGES, LANG) is Russian.
bool help_in_russian () {
    return Intl.get_language_names ()[0].has_prefix ("ru");
}

const string HELP_EN = """<span size="large" weight="bold">What gtk2adw does</span>

libadwaita apps ignore the system GTK theme and always look like Adwaita. The only file they read is <tt>~/.config/gtk-4.0/gtk.css</tt>. gtk2adw takes the colors of a GTK theme (Greybird, Arc, Numix or any other) and writes them there. Only colors change: the shape of widgets stays Adwaita.

<span size="large" weight="bold">How to use it</span>

• <b>GTK theme</b>: the active theme is selected on start; the list has search.
• <b>Preview</b> tab: a mockup of a libadwaita window. <b>After Apply</b> shows the selected theme, <b>Now</b> shows what libadwaita apps look like today. <b>Light / Dark</b> appears when the theme has its own dark variant.
• <b>Colors</b> tab: every color with its value, plus the dark variant if there is one.
• <b>Apply</b> writes the colors. This window recolors at once; other running libadwaita apps need a restart.
• <b>Remove</b> deletes the generated file. It is disabled when there is nothing to remove.

Apply again after changing the GTK theme: changes are not tracked automatically.

<span size="large" weight="bold">What exactly changes</span>

• <tt>~/.config/gtk-4.0/gtk.css</tt> is written. Its first line is <tt>/* gtk2adw: … */</tt>; only files with this line are overwritten or removed. Any other <tt>gtk.css</tt> is first renamed to <tt>gtk.css.&lt;unix time&gt;.bak</tt>.
• The color scheme (<tt>org.gnome.desktop.interface color-scheme</tt>) becomes <tt>prefer-dark</tt> for a dark theme and <tt>default</tt> for a light one, by the brightness of the window background.
• <tt>~/.config/gtk-3.0</tt> is not touched.

<span size="large" weight="bold">Where the colors come from</span>

Colors are read through GTK3, from the theme as GTK3 apps see it. Themes built on adw-gtk3 give libadwaita colors directly; for other themes the standard GTK3 colors are used:
• window, header bar, sidebar, dialogs: <tt>theme_bg_color</tt>, <tt>theme_fg_color</tt>
• views, cards, popovers: <tt>theme_base_color</tt>, <tt>theme_text_color</tt>
• accent: <tt>theme_selected_bg_color</tt>, <tt>theme_selected_fg_color</tt>
• destructive, error, success, warning: <tt>error_color</tt>, <tt>success_color</tt>, <tt>warning_color</tt>
If the theme has <tt>gtk-dark.css</tt>, its colors are used when the dark style is on.

<span size="large" weight="bold">Command line</span>

<tt>gtk2adw-cli</tt>  colors of the active GTK theme
<tt>gtk2adw-cli THEME</tt>  colors of the given theme
<tt>gtk2adw-cli --print [THEME]</tt>  show the colors, change nothing
<tt>gtk2adw-cli --list</tt>  installed GTK themes
<tt>gtk2adw-cli --off</tt>  remove the generated gtk.css

<span size="large" weight="bold">Limitations</span>

• Only colors; widget shapes, shadows and fixed shades stay Adwaita.
• Header bar and sidebar take the window background: GTK3 themes have no standard colors for them.
• Flatpak apps see the file only if allowed: <tt>flatpak override --user --filesystem=xdg-config/gtk-4.0:ro</tt>
• If <tt>GTK_THEME</tt> is set, it overrides everything; unset it.""";

const string HELP_RU = """<span size="large" weight="bold">Что делает gtk2adw</span>

Приложения на libadwaita игнорируют системную GTK-тему и всегда выглядят как Adwaita. Единственный файл, который они читают, это <tt>~/.config/gtk-4.0/gtk.css</tt>. gtk2adw берёт цвета GTK-темы (Greybird, Arc, Numix или любой другой) и записывает их туда. Меняются только цвета: форма виджетов остаётся от Adwaita.

<span size="large" weight="bold">Как пользоваться</span>

• <b>GTK theme</b>: при запуске выбрана активная тема, в списке есть поиск.
• Вкладка <b>Preview</b>: макет окна libadwaita. <b>After Apply</b> показывает выбранную тему, <b>Now</b> — как libadwaita-приложения выглядят сейчас. Переключатель <b>Light / Dark</b> появляется, если у темы есть свой тёмный вариант.
• Вкладка <b>Colors</b>: все цвета со значениями и тёмный вариант, если он есть.
• <b>Apply</b> записывает цвета. Это окно перекрашивается сразу, остальные запущенные libadwaita-приложения нужно перезапустить.
• <b>Remove</b> удаляет созданный файл. Кнопка неактивна, если удалять нечего.

После смены GTK-темы нажмите Apply ещё раз: автоматически изменения не отслеживаются.

<span size="large" weight="bold">Что именно меняется</span>

• Записывается <tt>~/.config/gtk-4.0/gtk.css</tt>. Его первая строка <tt>/* gtk2adw: … */</tt>; перезаписываются и удаляются только файлы с этой строкой. Любой другой <tt>gtk.css</tt> сначала переименовывается в <tt>gtk.css.&lt;unix-время&gt;.bak</tt>.
• Схема оформления (<tt>org.gnome.desktop.interface color-scheme</tt>) становится <tt>prefer-dark</tt> для тёмной темы и <tt>default</tt> для светлой, по яркости фона окна.
• <tt>~/.config/gtk-3.0</tt> не трогается.

<span size="large" weight="bold">Откуда берутся цвета</span>

Цвета читаются через GTK3 из темы так, как её видят GTK3-приложения. У тем на основе adw-gtk3 цвета libadwaita берутся напрямую, у остальных — стандартные цвета GTK3:
• окно, заголовок, боковая панель, диалоги: <tt>theme_bg_color</tt>, <tt>theme_fg_color</tt>
• поля, карточки, всплывающие меню: <tt>theme_base_color</tt>, <tt>theme_text_color</tt>
• акцент: <tt>theme_selected_bg_color</tt>, <tt>theme_selected_fg_color</tt>
• удаление, ошибка, успех, предупреждение: <tt>error_color</tt>, <tt>success_color</tt>, <tt>warning_color</tt>
Если у темы есть <tt>gtk-dark.css</tt>, его цвета используются при включённом тёмном стиле.

<span size="large" weight="bold">Командная строка</span>

<tt>gtk2adw-cli</tt>  цвета активной GTK-темы
<tt>gtk2adw-cli ТЕМА</tt>  цвета указанной темы
<tt>gtk2adw-cli --print [ТЕМА]</tt>  показать цвета, ничего не менять
<tt>gtk2adw-cli --list</tt>  установленные GTK-темы
<tt>gtk2adw-cli --off</tt>  удалить созданный gtk.css

<span size="large" weight="bold">Ограничения</span>

• Только цвета; форма виджетов, тени и фиксированные оттенки остаются от Adwaita.
• Заголовок окна и боковая панель берут цвет фона окна: стандартных цветов для них у GTK3-тем нет.
• Flatpak-приложения видят файл, только если им это разрешить: <tt>flatpak override --user --filesystem=xdg-config/gtk-4.0:ro</tt>
• Если задана переменная <tt>GTK_THEME</tt>, она перекрывает всё; уберите её.""";
