-- plugins/init.lua

local fn = vim.fn
local packer_install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- install packer
if fn.empty(fn.glob(packer_install_path)) > 0 then
    fn.system({
        'git',
        'clone',
        '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        packer_install_path
    })
    print("Packer installed. Restart Neovim.")
    vim.cmd [[packadd packer.nvim]]
end

-- load plugins
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'  -- packer sef managing

    -- add plugins here
end)

-- plugin configuration
