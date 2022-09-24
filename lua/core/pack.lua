local fn, uv, api = vim.fn, vim.loop, vim.api
local vim_path = require("core.global").vim_path
local data_dir = require("core.global").data_dir
local modules_dir = vim_path .. "/lua/modules"
local packer_compiled = data_dir .. "lua/_compiled.lua"
local packer = nil

local function peek_plugins()
    local plugins = {}
    local tmp = vim.split(fn.globpath(modules_dir, "*/plugins.lua"), "\n")
    for _, f in ipairs(tmp) do
        local plugins_full_path = f:sub(#modules_dir - 6, -1)
        local plugins_path = plugins_full_path:sub(0, #plugins_full_path - 4)
        local plugins_module = require(plugins_path)
        for repo, conf in pairs(plugins_module) do
            plugins[#plugins + 1] = vim.tbl_extend("force", { repo }, conf)
        end
    end
    return plugins
end

local function load_packer ()
    if not packer then
        api.nvim_command("packadd packer.nvim")
        packer = require("packer")
    end
    packer.init({
        -- If you want catppuccin setup function to actually reload without restarting nvim
        auto_reload_compiled = true,
        compile_path = packer_compiled,
        git = { clone_timeout = 60, default_url_format = "git@github.com:%s" },
        disable_commands = true,
    })
    packer.reset()
    local use = packer.use
    local plugins = peek_plugins()
    use({ "wbthomason/packer.nvim", opt = true })
    for _, plugin in ipairs(plugins) do
        use(plugin)
    end
end

local pack = setmetatable({}, {
    __index = function(_, key)
        if not packer then
            load_packer()
        end
        return packer[key]
    end,
})

function pack.ensure_plugins_installed()
    local packer_dir = data_dir .. "pack/packer/opt/packer.nvim"
    local state = uv.fs_stat(packer_dir)
    if not state then
        local cmd = "!git clone --depth 1 git@github.com:wbthomason/packer.nvim.git " .. packer_dir
        api.nvim_command(cmd)
        uv.fs_mkdir(data_dir .. "lua", 511, function()
            assert("make compile path dir failed")
        end)
        load_packer()
        packer.install()
    end
end

function pack.compile_and_notify()
    pack.compile()
    vim.notify("Compiled", vim.log.levels.INFO, { title = "Packer" })
end

function pack.auto_compile()
    local file = vim.fn.expand("%:p")
    if file:match(modules_dir) then
        pack.clean()
        pack.compile_and_notify()
    end
end

function pack.load_plugins()
    if vim.fn.filereadable(packer_compiled) == 1 then
        require("_compiled")
    else
        assert("Missing packer compile file Run PackerCompile Or PackerInstall")
    end

    vim.api.nvim_create_user_command("PackerCompile", pack.compile_and_notify, {})
    vim.api.nvim_create_user_command("PackerInstall", pack.install, {})
    vim.api.nvim_create_user_command("PackerUpdate", pack.update, {})
    vim.api.nvim_create_user_command("PackerSync", pack.sync, {})
    vim.api.nvim_create_user_command("PackerClean", pack.clean, {})
    vim.api.nvim_create_user_command("PackerStatus", pack.status, {})
end

return pack
