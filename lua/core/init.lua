local global = require("core.global")
local user_config = require("config")
local vim = vim

-- Create cache dir and subs dir
local createdir = function()
    local data_dir = {
        global.cache_dir .. "backup",
        global.cache_dir .. "session",
        global.cache_dir .. "swap",
        global.cache_dir .. "tags",
        global.cache_dir .. "undo",
    }
    -- There only check once that If cache_dir exists
    -- Then I don't want to check subs dir exists
    if vim.fn.isdirectory(global.cache_dir) == 0 then
        os.execute("mkdir -p " .. global.cache_dir)
        for _, v in pairs(data_dir) do
            if vim.fn.isdirectory(v) == 0 then
                os.execute("mkdir -p " .. v)
            end
        end
    end
end

local disable_distribution_plugins = function()
    vim.g.did_load_filetypes = 1
    vim.g.did_load_fzf = 1
    vim.g.did_load_gtags = 1
    vim.g.did_load_gzip = 1
    vim.g.did_load_tar = 1
    vim.g.did_load_tarPlugin = 1
    vim.g.did_load_zip = 1
    vim.g.did_load_zipPlugin = 1
    vim.g.did_load_getscript = 1
    vim.g.did_load_getscriptPlugin = 1
    vim.g.did_load_vimball = 1
    vim.g.did_load_vimballPlugin = 1
    vim.g.did_load_matchit = 1
    vim.g.did_load_matchparen = 1
    vim.g.did_load_2html_plugin = 1
    vim.g.did_load_logiPat = 1
    vim.g.did_load_rrhelper = 1
    vim.g.did_load_netrw = 1
    vim.g.did_load_netrwPlugin = 1
    vim.g.did_load_netrwSettings = 1
    vim.g.did_load_netrwFileHandlers = 1
end

local leader_map = function()
    vim.g.mapleader = " "
    vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
    vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

local neovide_config = function()
    vim.cmd("set guifont=" .. user_config.neovide_font)
    vim.g.neovide_refresh_rate = 30
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_no_idle = false
    vim.g.neovide_fullscreen = false
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_trail_length = 0.05
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_opacity = 200.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_speed = 20.0
    vim.g.neovide_cursor_vfx_particle_density = 5.0
end

local load_core = function()
    local pack = require("core.pack")

    createdir()

    disable_distribution_plugins()

    require("core.autocmd")

    -- 设置 leader key
    leader_map()

    -- 确保 packer 已下载
    pack.ensure_plugins()

    -- 配置 neovide
    neovide_config()

    -- 配置 vim 选项
    require("core.options")

    -- 配置 keymap
    require("core.keymap")

    -- 加载插件
    pack.load_compile()

    -- 设置主题色
    vim.cmd("colorscheme " .. user_config.colorscheme)
end

load_core()
