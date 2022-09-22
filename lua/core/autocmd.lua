-- Create an autocmd User PackerCompileDone to update it every time packer is compiled
vim.api.nvim_create_augroup("_catppuccin", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "_catppuccin",
    pattern = "PackerCompileDone",
    callback = function()
        vim.cmd "CatppuccinCompile"
        vim.defer_fn(function()
            vim.cmd "colorscheme catppuccin"
        end, 0) -- Defered for live reloading
    end
})

-- vim.api.nvim_create_augroup("_packer", { clear = true})
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = "_packer",
--     pattern = {"plugins.lua", "config.lua"},
--     callback = function ()
--         vim.cmd "PackerCompile"
--     end
-- })
