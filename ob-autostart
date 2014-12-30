#!/usr/bin/python2
# -*- coding: utf-8 -*-

##
#   OpenBox Autostart Control
#
#   Created by
#       ADcomp <david.madbox@gmail.com>
#       http://www.ad-comp.be/
#
#   This program is distributed under the terms of the GNU General Public License
#   For more info see http://www.gnu.org/licenses/gpl.txt
##

try:
    import os
    import sys
    import gtk
    import gobject
    import string
    import pwd
    import locale
    import gettext
except:
    print("ERROR : All required python dependencies were not found!")
    sys.exit()

## Not yet !
gettext.install('ob-autostart', './locale', unicode=1)

LAUNCH_LIST = []

# position in list
ID_ACTIVE = 0
ID_DESC = 1
ID_CMD = 2
ID_TIMER = 3

# Find the Name / Command / Icon from .desktop file
def info_desktop_file(file):
    name, cmd = None, None
    try:
        cfile = open(file,"r")

        for line in cfile:
            if '=' in line:
                words = line.split('=')
                if words[0] == 'Name':
                    name = words[1].replace('\n','')

                if words[0] == 'Exec':
                    cmd = words[1].replace('\n','')
                    cmd = cmd.split(' ')[0]
        cfile.close()
    except:
        print "Error : .desktop file info"
    return (name, cmd)

#----------------------------------------------------------------------------
class Conf:
#----------------------------------------------------------------------------
    def __init__(self):
        # Create window
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.set_title(_("OB Autostart"))
        self.window.set_position(gtk.WIN_POS_CENTER)
        self.window.connect("destroy", self.destroy)

        # Containers
        BoxBase = gtk.VBox()
        BoxBase.set_spacing(10)
        BoxBase.set_border_width(5)

        BoxList = gtk.VBox()
        BoxList.set_spacing(5)
        BoxList.set_border_width(5)

        BoxListControls = gtk.HButtonBox()

        BoxControls = gtk.HButtonBox()
        BoxControls.set_spacing(5)
        BoxControls.set_layout(gtk.BUTTONBOX_END)

        #Icon ListStore
        self.treeview = gtk.TreeView()
        model = gtk.ListStore(gobject.TYPE_STRING, gobject.TYPE_STRING, gobject.TYPE_STRING, gobject.TYPE_STRING)
        self.filtremodele = model.filter_new()
        self.treeview.set_model(model)

        cell_text = gtk.CellRendererText()
        col_text = gtk.TreeViewColumn(_("A"), cell_text, text=ID_ACTIVE)
        self.treeview.append_column(col_text)

        cell_text = gtk.CellRendererText()
        col_text = gtk.TreeViewColumn(_("Description"), cell_text, text=ID_DESC)
        self.treeview.append_column(col_text)

        cell_command = gtk.CellRendererText()
        col_command = gtk.TreeViewColumn(_("command"), cell_command, text=ID_CMD)
        #~ col_command.set_visible(False)
        self.treeview.append_column(col_command)

        cell_icon = gtk.CellRendererText()
        col_icon = gtk.TreeViewColumn(_("Time"), cell_icon, text=ID_TIMER)
        #~ col_icon.set_visible(True)
        self.treeview.append_column(col_icon)

        for my_item in LAUNCH_LIST:
            item = model.append(None)
            desc , cmd , timer, isactive = my_item

            model.set_value(item, ID_ACTIVE, str(isactive))
            model.set_value(item, ID_DESC, str(desc))
            model.set_value(item, ID_CMD, str(cmd))
            model.set_value(item, ID_TIMER, str(timer))

        self.treeview.connect("row-activated", self.EditItem)
        self.treeview.set_reorderable(True)
        self.treeview.get_selection().set_mode(gtk.SELECTION_SINGLE)

        ## Control buttons for list
        # Add
        button = gtk.Button(stock=gtk.STOCK_ADD)
        button.connect("clicked", self.button_control_new_clicked)
        BoxListControls.pack_start(button)
        # Delete
        button = gtk.Button(stock=gtk.STOCK_REMOVE)
        button.connect("clicked", self.button_control_delete_clicked)
        BoxListControls.pack_start(button)

        ## Main Controls
        # Save
        button_save = gtk.Button(stock=gtk.STOCK_SAVE)
        button_save.connect("clicked", self.saveconf)
        BoxControls.pack_end(button_save, False, False)
        # Exit
        button_exit = gtk.Button(stock=gtk.STOCK_CLOSE)
        button_exit.connect("clicked", self.destroy)
        BoxControls.pack_end(button_exit, False, False)

        BoxList.pack_start(self.treeview, True, True)
        BoxList.pack_end(BoxListControls, False, True)

        BoxBase.pack_start(BoxList, True)
        BoxBase.pack_start(gtk.HSeparator(), True)
        BoxBase.pack_end(BoxControls, False)

        self.window.add(BoxBase)

        ## Show main window frame and all content
        self.window.show_all()

    def saveconf(self, widget=None, event=None):
        '''Save configuration'''
        model = self.treeview.get_model()
        iter = model.get_iter_root()
        launch_list = []

        while (iter):
            tmp_data = (
                model.get_value(iter, ID_DESC),
                model.get_value(iter, ID_CMD),
                model.get_value(iter, ID_TIMER),
                model.get_value(iter, ID_ACTIVE)
                )
            launch_list.append(tmp_data)
            iter = model.iter_next(iter)

        home = pwd.getpwuid(os.getuid())[5]
        if not os.path.exists("%s/.config/ob-autostart" % home):
            os.makedirs("%s/.config/ob-autostart" % home)

        src = "%s/.config/ob-autostart/config" % home
        cfile = open(src,"w")
        cfile.write("# OB_Autostart config\n")
        cfile.write("LAUNCH_LIST = [ \n")
        for item in launch_list:
            desc = item[0]
            timer = str(item[2])
            isactive = item[3]
            cmd = item[1].replace("\"","\\\"")
            output = '\t ("%s","%s","%s","%s"),\n' % (desc,cmd,timer,isactive)
            cfile.write(output)
        cfile.write("\t]\n")

        if (cfile.closed == False):
            cfile.close()

    def EditItem(self, treeview, path=None, view_column=None):
        nsel = treeview.get_cursor()
        selection = nsel[0][0]
        if (selection is not None):
            item = {}
            model   = self.treeview.get_model()
            item['desc'] = model.get_value(model.get_iter(selection), ID_DESC)
            item['cmd'] = model.get_value(model.get_iter(selection), ID_CMD)
            item['timer'] = model.get_value( model.get_iter(selection), ID_TIMER )
            item['is_active'] = model.get_value( model.get_iter(selection), ID_ACTIVE )
            Edit_Item(self.window, item, model, selection)

    # Add new treeview object, position=-1 inserts  into cursor's position
    def new_treeview_entry(self, position=-1, insertAfter=True):
        self.treeview.grab_focus()
        model = self.treeview.get_model()
        try:
            position = self.treeview.get_cursor()[0][0]
            try:
                iter = model.get_iter(position)
            except ValueError:
                print("> Empty list ?")
                iter = model.get_iter()

            if (insertAfter == True):
                item = model.insert_after(iter)
            else:
                item = model.insert_before(iter)
        except TypeError:
            print "typeError _ treeview"
            item = model.append(None)
            self.treeview.grab_focus()

        model.set_value(item, ID_DESC, '')
        model.set_value(item, ID_CMD, '')
        model.set_value(item, ID_TIMER, '0')
        model.set_value(item, ID_ACTIVE, '')

        ## Set focus to new entry and edit
        path = model.get_path(model.get_iter(position+1))
        self.treeview.set_cursor(path)
        self.EditItem(self.treeview)

    def button_control_new_clicked(self, n):
        self.new_treeview_entry()
        return

    def button_control_delete_clicked(self, n):
        # remove item from configuration
        try:
            self.treeview.grab_focus()
            pos = self.treeview.get_cursor()[0][0]
            model = self.treeview.get_model()
            self.treeview.set_cursor(pos-1)
            self.treeview.grab_focus()
            model.remove(model.get_iter(pos))
            if pos < 0:
                pos = 0
            # Set the focus and cursor correctly
            self.treeview.set_cursor(pos);
            self.treeview.grab_focus()
        except TypeError:
            print( "> nothing to delete !?" )

    def main(self):
        gtk.main()

    def destroy(self, widget=None, data=None):
        self.window.hide()
        gtk.main_quit()

#----------------------------------------------------------------------------
class Edit_Item:
#----------------------------------------------------------------------------
    def __init__(self, master, item, model, selection):
        self.model = model
        self.selection = selection

        # Create window
        self.master = master
        self.window = gtk.Dialog(_("Edit Item"), master, gtk.DIALOG_MODAL, buttons=None)
        self.window.set_default_size(400, 100)
        self.window.set_position(gtk.WIN_POS_CENTER)

        self.frame = gtk.Frame()
        self.frame.set_border_width(5)

        BoxOptions = gtk.VBox()
        BoxOptions.set_border_width(10)
        self.frame.add(BoxOptions)
        BoxOptions.set_spacing(10)

        #Command options
        label = gtk.Label(_("Description:"))

        self.description = gtk.Entry()
        self.description.set_text(item['desc'])

        box = gtk.HBox()
        box.pack_start(label, False, False)
        box.pack_end(self.description, True, True)
        BoxOptions.pack_start(box, False, True)

        #Command options
        label = gtk.Label(_("Command:"))

        self.text_command = gtk.Entry()
        command = item['cmd'].replace("\\\"", "\"")
        self.text_command.set_text(command)

        self.button_command = gtk.Button("...")
        self.button_command.connect("clicked", self.button_command_clicked)

        box = gtk.HBox()
        box.pack_start(label, False, False)
        box.pack_start(self.text_command, True, True)
        box.pack_end(self.button_command, False, True)
        BoxOptions.pack_start(box, False, True)


        self.is_active_chk = gtk.CheckButton('is active')
        self.is_active_chk.show()
        if item['is_active']=="*":
            self.is_active_chk.set_active(1)

        sep = gtk.VSeparator()

        #Icon options
        label = gtk.Label("Sleep:")

        ## Timer _ Sleep
        timer = float(item['timer'])
        adjustment = gtk.Adjustment(value=timer, lower=0, upper=600, step_incr=1, page_incr=10, page_size=0)
        self.sleep_time = gtk.SpinButton(adjustment=adjustment, climb_rate=0.0, digits=0)

        box = gtk.HBox()
        box.pack_start(self.is_active_chk, False, False)
        box.pack_start(sep, True, True)
        box.pack_start(label, False, False)
        box.pack_end(self.sleep_time, False, False)
        BoxOptions.pack_start(box, False, True)

        self.window.vbox.pack_start(self.frame)

        bouton = gtk.Button(stock=gtk.STOCK_CANCEL)
        bouton.connect("clicked", self.close)
        self.window.action_area.pack_start(bouton, True, True, 0)
        bouton.show()

        bouton = gtk.Button(stock=gtk.STOCK_OK)
        bouton.connect("clicked", self.change_item)
        self.window.action_area.pack_start(bouton, True, True, 0)
        bouton.show()

        #Show main window frame and all content
        self.window.show_all()
        self.window.run()

    def change_item(self, data):
        command = self.text_command.get_text()
        desc = self.description.get_text()
        timer = int(self.sleep_time.get_value())
        isactive = ''
        if self.is_active_chk.get_active():
            isactive = "*"
        item    = self.model.get_iter(self.selection)

        self.model.set_value(item, ID_DESC, desc)
        self.model.set_value(item, ID_CMD, command)
        self.model.set_value(item, ID_TIMER, timer)
        self.model.set_value(item, ID_ACTIVE, isactive)
        self.close()

    def close(self, data=None):
        self.window.hide()
        self.window.destroy()

    def button_command_clicked(self, n):
        dialog = gtk.FileChooserDialog(_("Select command.."),
                                        None,
                                        gtk.FILE_CHOOSER_ACTION_OPEN,
                                        (gtk.STOCK_CANCEL,
                                        gtk.RESPONSE_CANCEL,
                                        gtk.STOCK_OPEN,
                                        gtk.RESPONSE_OK))
        dialog.set_default_response(gtk.RESPONSE_OK)

        filter = gtk.FileFilter()
        filter.set_name(_("All files"))
        filter.add_pattern("*")
        dialog.add_filter(filter)
        dialog.set_current_folder('/usr/share/applications')

        response = dialog.run()
        if response == gtk.RESPONSE_OK:
            ## .desktop file selected ?
            filename = dialog.get_filename()
            if '.desktop' in filename:
                name, cmd = info_desktop_file(filename)
                self.text_command.set_text(cmd)
                self.description.set_text(name)
            else:
                self.text_command.set_text(filename)
        dialog.destroy()

if __name__ == "__main__":
    home = pwd.getpwuid(os.getuid())[5]
    os.chdir(home)
    cfg_file = None

    if os.access("%s/.config/ob-autostart/config" % home, os.F_OK|os.R_OK):
        execfile("%s/.config/ob-autostart/config" % home)
    del home

    if len(sys.argv) == 2:
        if sys.argv[1] == "-d":
            for item in LAUNCH_LIST:
                cmd = item[1]
                timer = int(item[2])
                is_active = item[3]
                if is_active == '*' and cmd != "":
                    if timer > 0:
                        cmd = "sleep %ss && %s" % (timer,cmd)
                    print cmd
                    os.spawnl(os.P_NOWAIT, "/bin/sh", "/bin/sh", "-c", cmd)
    else:
        conf = Conf()
        conf.main()