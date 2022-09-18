local vim = vim

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.enhance_align = function(key)
	vim.cmd([[packadd vim-easy-align]])
	local map = { ["nga"] = "<Plug>(EasyAlign)", ["xga"] = "<Plug>(EasyAlign)" }
	return t(map[key])
end

local _gitui = nil
_G.toggle_gitui = function()
	if not _gitui then
		local Terminal = require("toggleterm.terminal").Terminal
		_gitui = Terminal:new({
			cmd = "gitui",
			hidden = true,
			direction = "float",
		})
	end
	_gitui:toggle()
end
