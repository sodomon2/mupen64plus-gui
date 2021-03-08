--[[--
 @package   mupen64plus-gui
 @filename  interface.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      22.08.2020 16:14:54 -04
--]]

function ui.main_window:on_destroy()
    Gtk.main_quit()
end

function ui.menu_file_close:on_button_press_event()
    Gtk.main_quit()
end

function ui.menu_file_rom:on_button_press_event()
    ui.chooser_rom:run()
    ui.chooser_rom:hide()
end

function ui.btn_chooser_rom_close:on_clicked()
    ui.chooser_rom:hide()
end

function ui.btn_chooser_rom_open:on_clicked()
    roms = ui.chooser_rom:get_filename(chooser):gsub(" ", "\\ ")
    os.execute("mupen64plus ".. roms .."  &")
	table.insert(conf.history.recents, roms)
	config:save('mupen64plus.json', conf)
    ui.chooser_rom:hide()
end

function ui.menu_about:on_button_press_event()
	ui.about_window:run()
	ui.about_window:hide()
end 

function ui.img:on_realize()
	print(self.window:get_xid())
	self.window:get_xid()
end
