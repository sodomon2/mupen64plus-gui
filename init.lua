#!/usr/bin/lua5.1

require 'lib.middleclass'
json       = require 'lib.json'
config     = require 'lib.configuration'
utils      = require 'lib.utils'

lgi        = require('lgi')            -- requiero esta libreria que me permitira usar GTK
GObject    = lgi.GObject               -- parte de lgi
GLib       = lgi.GLib                  -- para el treeview
Gdk    	   = lgi.Gdk                   -- para las keybindings
GdkX11     = lgi.GdkX11                -- manejo de ventanas de X Window System
Gtk        = lgi.require('Gtk', '3.0') -- el objeto GTK

assert     = lgi.assert
builder    = Gtk.Builder()

assert(builder:add_from_file('views/mupen64plus.ui'),"error al cargar el archivo") -- hago un debugger, si este archivo existe (true) enlaso el archivo ejemplo.ui, si no existe (false) imprimo un error
ui = builder.objects
conf = config:load('mupen64plus.json')

-- mupen64plus-gui
require('src.recents')
require('src.interface')

ui.main_window:show_all()
Gtk.main()
