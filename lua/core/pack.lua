local fn, uv, api = vim.fn, vim.loop, vim.api
local vim_path = require("core.global").vim_path
local data_dir = require("core.global").data_dir
local modules_dir = vim_path .. "/lua/modules"
local packer_compiled = data_dir .. "lua/_compiled.lua"
local packer = nil

local Packer = {}
Packer.__index = Packer

function Packer:load_plugins()
    self.repos = {}

    local get_plugins_list = function()
        local list = {}
        local tmp = vim.split(fn.globpath(modules_dir, "*/plugins.lua"), "\n")
        for _, f in ipairs(tmp) do
            list[#list + 1] = f:sub(#modules_dir - 6, -1)
        end
        return list
    end

    local plugins_file = get_plugins_list()
    for _, m in ipairs(plugins_file) do
        local repos = require(m:sub(0, #m - 4))
        for repo, conf in pairs(repos) do
            self.repos[#self.repos + 1] = vim.tbl_extend("force", { repo }, conf)
        end
    end
end

function Packer:load_packer()
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
    self:load_plugins()
    use({ "wbthomason/packer.nvim", opt = true })
    for _, repo in ipairs(self.repos) do
        use(repo)
    end
end

function Packer:init_ensure_plugins()
    local packer_dir = data_dir .. "pack/packer/opt/packer.nvim"
    local state = uv.fs_stat(packer_dir)
    if not state then
        local cmd = "!git clone --depth 1 git@github.com:wbthomason/packer.nvim.git " .. packer_dir
        api.nvim_command(cmd)
        uv.fs_mkdir(data_dir .. "lua", 511, function()
            assert("make compile path dir failed")
        end)
        self:load_packer()
        packer.install()
    end
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        if not packer then
            Packer:load_packer()
        end
        return packer[key]
    end,
})

function plugins.ensure_plugins()
    Packer:init_ensure_plugins()
end

function plugins.compile_and_backup()
    plugins.compile()
    vim.notify("Packer Compile Success!", vim.log.levels.INFO, { title = "Packer" })
end

function plugins.auto_compile()
    local file = vim.fn.expand("%:p")
    if file:match(modules_dir) then
        plugins.clean()
        plugins.compile_and_backup()
    end
end

function plugins.load_compile()
    if vim.fn.filereadable(packer_compiled) == 1 then
        require("_compiled")
    else
        assert("Missing packer compile file Run PackerCompile Or PackerInstall to fix")
    end

    vim.api.nvim_create_user_command("PackerCompile", plugins.compile_and_backup, {})
    vim.api.nvim_create_user_command("PackerInstall", plugins.install, {})
    vim.api.nvim_create_user_command("PackerUpdate", plugins.update, {})
    vim.api.nvim_create_user_command("PackerSync", plugins.sync, {})
    vim.api.nvim_create_user_command("PackerClean", plugins.clean, {})
    vim.api.nvim_create_user_command("PackerStatus", function ()
        plugins.compile()
        require('packer').status()
    end, {})
end

return plugins
