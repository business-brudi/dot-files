-- plugins.lua

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

    use {
        'neovim/nvim-lspconfig', -- basic lsp setup
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.rust_analyzer.setup{}
        end,
    }

    -- rust
    use 'simrat39/rust-tools.nvim'

    use {
        'hrsh7th/nvim-cmp',
        requires = {
              {'hrsh7th/cmp-nvim-lsp'},
              {'hrsh7th/cmp-buffer'},
              {'hrsh7th/cmp-path'},
              {'hrsh7th/cmp-cmdline'},
        },
        config = function()
              local cmp = require'cmp'
              cmp.setup({
      })
    end
    }

end)

-- plugin configuration
-- rust
local rust_tools = require("rust-tools")
rust_tools.setup({
	server = {
		on_attach = function(_, bufnr)
			-- hover actions
			vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
			-- code action groups
			vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})
