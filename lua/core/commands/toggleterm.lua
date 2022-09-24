local root_dir = require("core.global").root_dir

local M = {}

local Terms = {}

local float_opts = {
    border = "single",
}

local function toggle_term(name)
    Terms[name].term:toggle()
    Terms[name].open = not Terms[name].open
end

local function register_term(name, term, direction)
    Terms[name] = {
        open = false,
        direction = direction,
        term = term,
    }
end

local function get_term(name)
    return Terms[name]
end

local function is_float(name)
    return Terms[name].direction == 'float'
end

local function is_vertical(name)
    return Terms[name].direction == 'vertical'
end

local function is_horizontal(name)
    return Terms[name].direction == 'horizontal'
end

local function is_open(name)
    return get_term(name).open
end

local function hide_term(name)
    if is_open(name) then
        toggle_term(name)
    end
end

function M.toggle_gitui()
    local name = '_gitui'
    if not get_term(name) then
        local Terminal = require("toggleterm.terminal").Terminal
        register_term(name, Terminal:new({
            cmd = "gitui",
            direction = "float",
            dir = root_dir,
            hidden = true,
            float_opts = float_opts,
            start_in_insert = true,
            env = {
                TERM_NAME = "gitui"
            },
        }), "float")
    end
    toggle_term(name)
end

function M.toggle_float(name)
    if not get_term(name) then
        local Terminal = require("toggleterm.terminal").Terminal
        register_term(name, Terminal:new({
            direction = "float",
            dir = root_dir,
            hidden = true,
            start_in_insert = true,
            float_opts = float_opts,
            env = {
                TERM_NAME = name
            },
        }), "float")
    end
    -- 打开前关闭所有其他浮动 Terminal
    if not is_open(name) then
        for _name, _ in pairs(Terms) do
            if is_float(_name) then
                hide_term(_name)
            end
        end
    end
    toggle_term(name)
end

function M.toggle_vertical(name)
    if not get_term(name) then
        local Terminal = require("toggleterm.terminal").Terminal
        register_term(name, Terminal:new({
            direction = "vertical",
            dir = root_dir,
            hidden = true,
            start_in_insert = true,
            env = {
                TERM_NAME = name
            },
        }), "vertical")
    end
    -- 打开前关闭所有其他 horizontal Terminal
    if not is_open(name) then
        for _name, _ in pairs(Terms) do
            if is_horizontal(_name) then
                hide_term(_name)
            end
        end
    end
    toggle_term(name)
end

function M.toggle_horizontal(name)
    if not get_term(name) then
        local Terminal = require("toggleterm.terminal").Terminal
        register_term(name, Terminal:new({
            direction = "horizontal",
            dir = root_dir,
            hidden = true,
            start_in_insert = true,
            env = {
                TERM_NAME = name
            },
        }), "horizontal")
    end
    -- 打开前关闭所有其他 vertical Terminal
    if not is_open(name) then
        for _name, _ in pairs(Terms) do
            if is_vertical(_name) then
                hide_term(_name)
            end
        end
    end
    toggle_term(name)
end

return M
