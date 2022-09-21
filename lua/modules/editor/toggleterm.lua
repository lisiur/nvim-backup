local root_dir = require("core.global").root_dir

local M = {}

local BuiltinTerms = {
    gitui = nil,
    unname = nil,
}

local UserTerms = {}

local float_opts = {
    border = "double",
}

function M.toggle_gitui()
	if not BuiltinTerms.gitui then
        local Terminal = require("toggleterm.terminal").Terminal
		BuiltinTerms.gitui = Terminal:new({
			cmd = "gitui",
			direction = "float",
            dir = root_dir,
			hidden = true,
            float_opts,
		})
	end
	BuiltinTerms.gitui:toggle()
end

function M.toggle_unname()
	if not BuiltinTerms.unname then
        local Terminal = require("toggleterm.terminal").Terminal
		BuiltinTerms.unname = Terminal:new({
			direction = "float",
            dir = root_dir,
			hidden = true,
            float_opts,
		})
	end
	BuiltinTerms.unname:toggle()
end

function M.toggle_oneshot()
    local Terminal = require("toggleterm.terminal").Terminal
    Terminal:new({
        direction = "float",
        dir = root_dir,
        hidden = false,
        float_opts,
    }):toggle()
end

function M.toggle_float(name)
    if not UserTerms[name] then
        local Terminal = require("toggleterm.terminal").Terminal
        UserTerms[name] = Terminal:new({
            direction = "float",
            dir = root_dir,
            hidden = true,
            float_opts = {
                border = "double",
            },
        })
    end
    UserTerms[name]:toggle()
end

return M
