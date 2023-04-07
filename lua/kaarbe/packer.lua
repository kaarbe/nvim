-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.1",
		-- or                            , branch = "0.1.x",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	-- Color scheme rose-pine
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("rose-pine").setup({
        dark_variant = "moon"
      })
			vim.cmd("colorscheme rose-pine")
		end
	})

	-- LSP Zero
	use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},             -- Required
			{"williamboman/mason.nvim"},           -- Optional
			{"williamboman/mason-lspconfig.nvim"}, -- Optional

			-- Autocompletion
			{"hrsh7th/nvim-cmp"},         -- Required
			{"hrsh7th/cmp-nvim-lsp"},     -- Required
			{"hrsh7th/cmp-buffer"},       -- Optional
			{"hrsh7th/cmp-path"},         -- Optional
			{"saadparwaiz1/cmp_luasnip"}, -- Optional
			{"hrsh7th/cmp-nvim-lua"},     -- Optional

			-- Snippets
			{"L3MON4D3/LuaSnip"},             -- Required
			{"rafamadriz/friendly-snippets"}, -- Optional
		}
	}

  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  -- Git status
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }

  -- Command mode auto-suggestions
  use {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require("wilder")
      wilder.setup({ modes = { ":", "/", "?" } })
      wilder.set_option("renderer", wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
      }))
    end
  }

  -- Status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
	use("nvim-treesitter/playground")
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

end)
