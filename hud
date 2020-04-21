#!/usr/bin/env python3

import gi
gi.require_version("Gtk", "3.0")

import dbus
import psutil
import subprocess
from Xlib import display, protocol, X
import time

###########################################################################
## Helpers
###########################################################################

class EWMH:
		"""This class provides the ability to get and set properties defined
		by the EWMH spec. It was blanty ripped out of pyewmh
			* https://github.com/parkouss/pyewmh
		"""

		def __init__(self, _display=None, root = None):
				self.display = _display or display.Display()
				self.root = root or self.display.screen().root

		def getActiveWindow(self):
				"""Get the current active (toplevel) window or None (property _NET_ACTIVE_WINDOW)

				:return: Window object or None"""
				active_window = self._getProperty('_NET_ACTIVE_WINDOW')
				if active_window == None:
						return None

				return self._createWindow(active_window[0])

		def _getProperty(self, _type, win=None):
				if not win:
						win = self.root
				atom = win.get_full_property(self.display.get_atom(_type), X.AnyPropertyType)
				if atom:
						return atom.value

		def _setProperty(self, _type, data, win=None, mask=None):
				"""Send a ClientMessage event to the root window"""
				if not win:
						win = self.root
				if type(data) is str:
						dataSize = 8
				else:
						data = (data+[0]*(5-len(data)))[:5]
						dataSize = 32

				ev = protocol.event.ClientMessage(window=win, client_type=self.display.get_atom(_type), data=(dataSize, data))

				if not mask:
						mask = (X.SubstructureRedirectMask|X.SubstructureNotifyMask)
				self.root.send_event(ev, event_mask=mask)

		def _createWindow(self, wId):
				if not wId:
						return None
				return self.display.create_resource_object('window', wId)

action_counter = 0
def format_path(path):
	global action_counter
	result = path.replace("Root > ", "")
	result = result.replace("Label Empty > ", "")
	result = result.replace("_", "")
	result = result.replace(" > ", str(action_counter).zfill(4) + " .", 1)
	action_counter += 1
	return result

###########################################################################
## HUD Codes
###########################################################################

"""
	try_appmenu_interface
"""
def try_appmenu_interface(window_id):
	# --- Get Appmenu Registrar DBus interface
	session_bus = dbus.SessionBus()
	appmenu_registrar_object = session_bus.get_object('com.canonical.AppMenu.Registrar', '/com/canonical/AppMenu/Registrar')
	appmenu_registrar_object_iface = dbus.Interface(appmenu_registrar_object, 'com.canonical.AppMenu.Registrar')

	# --- Get dbusmenu object path
	try:
		dbusmenu_bus, dbusmenu_object_path = appmenu_registrar_object_iface.GetMenuForWindow(window_id)
	except dbus.exceptions.DBusException:
		return

		# --- Access dbusmenu items
	dbusmenu_object = session_bus.get_object(
		dbusmenu_bus, dbusmenu_object_path)
	dbusmenu_object_iface = dbus.Interface(
		dbusmenu_object, 'com.canonical.dbusmenu')
	dbusmenu_root_item = dbusmenu_object_iface.GetLayout(
		0, 0, ["label", "children-display"])

	dbusmenu_item_dict = dict()

	#For excluding items which have no action
	blacklist = []
	""" expanse_all_menu_with_dbus """
	def expanse_all_menu_with_dbus(item, root, path):
		item_id = item[0]
		item_props = item[1]

		# expand if necessary
		if 'children-display' in item_props:
			dbusmenu_object_iface.AboutToShow(item_id)
			dbusmenu_object_iface.Event(item_id, "opened", "not used", dbus.UInt32(time.time())) #fix firefox
		try:
			item = dbusmenu_object_iface.GetLayout(item_id, 1, ["label", "children-display"])[1]
		except:
			return

		item_children = item[2]

		if 'label' in item_props:
			new_path = path + " > " + item_props['label']
		else:
			new_path = path

		if len(item_children) == 0:
			if new_path not in blacklist:
				dbusmenu_item_dict[format_path(new_path)] = item_id
		else:
			blacklist.append(new_path)
			for child in item_children:
				expanse_all_menu_with_dbus(child, False, new_path)

	expanse_all_menu_with_dbus(dbusmenu_root_item[1], True, "")

	menuKeys = sorted(dbusmenu_item_dict.keys())

	# --- Run rofi/dmenu
	menu_string = ''
	head, *tail = menuKeys
	menu_string = head
	for m in tail:
		menu_string += '\n'
		menu_string += m

	menu_cmd = subprocess.Popen(['rofi', '-dmenu', '-i',
								'-p', 'HUD',
								'-columns', '1'
								'-location', '1',
								'-monitor', '-5',
								'-width', '60',
								'-lines', '25',
								'-fixed-num-lines'
								'-separator-style', 'solid'],
								stdout=subprocess.PIPE, stdin=subprocess.PIPE)
	menu_cmd.stdin.write(menu_string.encode('utf-8'))
	menu_result = menu_cmd.communicate()[0].decode('utf8').rstrip()
	menu_cmd.stdin.close()

	if menu_result.endswith("\n"):
		menu_result = menu_result[:-1]

	# --- Use menu result
	if menu_result in dbusmenu_item_dict:
		action = dbusmenu_item_dict[menu_result]
		dbusmenu_object_iface.Event(action, 'clicked', 0, 0)

	# --- Fix firefox: send closed events to level 1 items to make sure nothing weird happen
	# Firefox will close the submenu items (luckily!)
	# For example VimFx extension wont work without this!
	dbusmenu_level1_items = dbusmenu_object_iface.GetLayout(0, 1, ["label"])[1]
	for item in dbusmenu_level1_items[2]:
		item_id = item[0]
		dbusmenu_object_iface.Event(item_id, "closed", "not used", dbus.UInt32(time.time()))

"""
	try_gtk_interface
"""
def try_gtk_interface(gtk_bus_name, gtk_menu_object_path, gtk_actions_paths_list):

	# --- Ask for menus over DBus --- Credit @1931186
	session_bus = dbus.SessionBus()
	gtk_menu_object = session_bus.get_object(gtk_bus_name, gtk_menu_object_path)
	gtk_menu_menus_iface = dbus.Interface(gtk_menu_object, dbus_interface='org.gtk.Menus')

	# Here's the deal: The idea is to reduce the number of calls to the proxy and keep it as low as possible
	# because the proxy is a potential bottleneck
	# This means we ignore GMenus standard building model and just iterate over all the information one Start() provides at once
	# Start() does these calls, returns the result and keeps track of all parents (the IDs used by org.gtk.Menus.Start()) we called
	# queue() adds a parent to a potential_new_layers list; we'll use this later to avoid starting() some layers twice
	# explore is for iterating over the information a Start() call provides

	gtk_menubar_action_dict = dict()
	gtk_menubar_action_target_dict = dict()

	usedLayers = []
	def Start(i):
		usedLayers.append(i)
		return gtk_menu_menus_iface.Start([i])

	# --- Construct menu list ---

	potential_new_layers = []
	def queue(potLayer, label, path):
		# collects potentially new layers to check them against usedLayers
		# potLayer: ID of potential layer, label: None if nondescript, path
		potential_new_layers.append([potLayer, label, path])

	def explore(parent, path):
		for node in parent:
			content = node[2]
			# node[0] = ID of parent
			# node[1] = ID of node under parent
			# node[2] = actuall content of a node; this is split up into several elements/ menu entries
			for element in content:
				# We distinguish between labeled entries and unlabeled ones
				# Unlabeled sections/ submenus get added under to parent ({parent: {content}}), labeled under a key in parent (parent: {label: {content}})
				if 'label' in element:
					if ':section' in element or ':submenu' in element:
						# If there's a section we don't care about the action
						# There theoretically could be a section that is also a submenu, so we have to handel this via queue
						# submenus are more important than sections
						if ':submenu' in element:
							queue(element[':submenu'][0], None, path + " > " + element['label'])
							# We ignore whether or not a submenu points to a specific index, shouldn't matter because of the way the menu got exportet
							# Worst that can happen are some duplicates
							# Also we don't Start() directly which could mean we get nothing under this label but this shouldn't really happen because there shouldn't be two submenus
							# that point to the same parent. Even if this happens it's not that big of a deal.
						if ':section' in element:
							if element[':section'][0] != node[0]:
								queue(element['section'][0], element['label'], path)
								# section points to other parent, we only want to add the elements if their parent isn't referenced anywhere else
								# We do this because:
								# a) It shouldn't happen anyways
								# b) The worst that could happen is we fuck up the menu structure a bit and avoid double entries
					elif 'action' in element:
						# This is pretty straightforward:
						menu_action = str(element['action']).split(".",1)[1]
						action_path = format_path(path + " > " + element['label'])
						gtk_menubar_action_dict[action_path] = menu_action
						if 'target' in element:
							gtk_menubar_action_target_dict[action_path] = element['target']
				else:
					if ':submenu' in element or ':section' in element:
						if ':section' in element:
							if element[':section'][0] != node[0] and element['section'][0] not in usedLayers:
								queue(element[':section'][0], None, path)
								# We will only queue a nondescript section if it points to a (potentially) new parent
						if ':submenu' in element:
							queue(element[':submenu'][0], None, path)
							# We queue the submenu under the parent without a label

	queue(0, None, "")
	# We queue the first parent, [0]
	# This means 0 gets added to potential_new_layers with a path of "" (it's the root node)

	while len(potential_new_layers) > 0:
		layer = potential_new_layers.pop()
		# usedLayers keeps track of all the parents Start() already called
		if layer[0] not in usedLayers:
			explore(Start(layer[0]), layer[2])

	gtk_menu_menus_iface.End(usedLayers)

	menuKeys = sorted(gtk_menubar_action_dict.keys())

	# --- Run rofi/dmenu
	menu_string = ''
	head, *tail = menuKeys
	menu_string = head
	for m in tail:
		menu_string += '\n'
		menu_string += m

	menu_cmd = subprocess.Popen(['rofi', '-dmenu', '-i',
								'-p', 'HUD',
								'-columns', '1'
								'-location', '1',
								'-monitor', '-5',
								'-width', '60',
								'-lines', '25',
								'-fixed-num-lines'
								'-separator-style', 'solid'],
								stdout=subprocess.PIPE, stdin=subprocess.PIPE)
	menu_cmd.stdin.write(menu_string.encode('utf-8'))
	menu_result = menu_cmd.communicate()[0].decode('utf8').rstrip()
	menu_cmd.stdin.close()

	if menu_result.endswith("\n"):
		menu_result = menu_result[:-1]

	# --- Use menu result
	# --- We have to use the old dbus API here since the variant type * is not implemented :((
	session_bus = dbus.SessionBus()
	if menu_result in gtk_menubar_action_dict:
		action = gtk_menubar_action_dict[menu_result]
		target = []
		try:
			target = gtk_menubar_action_target_dict[menu_result]
			if (not isinstance(target, list)):
				target = [target]
		except:
			pass

		for action_path in gtk_actions_paths_list:
			try:
				action_object = session_bus.get_object(gtk_bus_name, action_path)
				action_iface = dbus.Interface(action_object, dbus_interface='org.gtk.Actions')
				not_use_platform_data = dict()
				not_use_platform_data["not used"] = "not used"
				action_iface.Activate(action, target, not_use_platform_data)
			except Exception as e:
				print ("____________________________________________________")
				print (action_path)
				print (str(e))


###########################################################################
## Main
###########################################################################

# Get Window properties and GTK MenuModel Bus name
ewmh = EWMH()
win = ewmh.getActiveWindow()
window_id = hex(ewmh._getProperty('_NET_ACTIVE_WINDOW')[0])
window_pid = ewmh._getProperty('_NET_WM_PID', win)[0]
prompt = psutil.Process(window_pid).name() + ': '
gtk_bus_name = ewmh._getProperty('_GTK_UNIQUE_BUS_NAME', win)
gtk_menu_object_path = ewmh._getProperty('_GTK_MENUBAR_OBJECT_PATH', win)
gtk_app_object_path = ewmh._getProperty('_GTK_APPLICATION_OBJECT_PATH', win)
gtk_win_object_path = ewmh._getProperty('_GTK_WINDOW_OBJECT_PATH', win)
gtk_unity_object_path = ewmh._getProperty('_UNITY_OBJECT_PATH', win)
gtk_bus_name, gtk_menu_object_path, gtk_app_object_path, gtk_win_object_path, gtk_unity_object_path = \
			[i.decode("utf8") if isinstance(i, bytes) \
			else i for i in [gtk_bus_name, gtk_menu_object_path, gtk_app_object_path, gtk_win_object_path, gtk_unity_object_path]]
# print('Window id is : %s', window_id)
# print('Window pid is : %s', window_pid)
# print('Prompt is : %s', prompt)
# print('_GTK_UNIQUE_BUS_NAME: %s', gtk_bus_name)
# print('_GTK_MENUBAR_OBJECT_PATH: %s', gtk_menu_object_path)
# print('_GTK_APPLICATION_OBJECT_PATH: %s', gtk_app_object_path)
# print('_GTK_WINDOW_OBJECT_PATH: %s', gtk_win_object_path)
# print('_UNITY_OBJECT_PATH: %s', gtk_unity_object_path)

if (not gtk_bus_name) or (not gtk_menu_object_path):
	try_appmenu_interface(int(window_id, 16))
else:
	# Many apps does not respect menu action groups (libreoffice, gnome-mpv) thus we have to include all action groups
	# And many other apps have these properties point to the same path (Sigh!), so we need to remove them!
	gtk_actions_paths_list = [gtk_win_object_path, gtk_menu_object_path, gtk_app_object_path, gtk_unity_object_path]
	gtk_actions_paths_list = list(set(gtk_actions_paths_list))
	try_gtk_interface(gtk_bus_name, gtk_menu_object_path, gtk_actions_paths_list)
