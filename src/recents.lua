--[[--
 @package   mupen64plus-gui
 @filename  recents.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      22.08.2020 16:14:54 -04
--]]

recents_item = conf.history.recents

function create_submenu(depth)
	if depth < 1 then return nil end
	local menu_recent = Gtk.Menu()
	for i, uri in pairs(recents_item) do
    filename = utils:path_name(uri)['name']
        rom = utils:path_name(uri)['path']
		local item = Gtk.MenuItem {
			label = ("%d. %s"):format(i, filename):gsub("\\ ", " "),
			submenu = create_submenu(depth - 1, true),
			on_button_press_event = function ()
				-- @TODO: esto se puede mejorar
                os.execute("mupen64plus ".. rom .."  &")
				ui.statusbar:push(0, tostring(filename):gsub("\\ ", " "))
			end
		}
		menu_recent:append(item)
	end
	return menu_recent
end

ui.menu_file_recents.submenu = create_submenu(1)

if #recents_item < 1 then
	ui.menu_file_recents.sensitive = false
    return
end 


