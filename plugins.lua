local overrides = require "custom.configs.overrides"

local plugins = {
  {
    -- lsp configuration (language server protocol)
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    -- parsers  --
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.nvim_treesitter,
  },
  --
  {
    -- used to install lsp servers, formatters, linters and debug adapters
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,

    dependencies = {
      "nvim-tree/nvim-web-devicons",
      opts = function()
        require "custom.configs.nvim-web-devicons"
      end,
      config = function(_, opts)
        require("nvim-web-devicons").setup(opts)
      end,
    },
  },
  {
    "max397574/better-escape.nvim",
    enabled = true,
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- debugging -----------------------
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      { "mfussenegger/nvim-dap" },
      {
        "folke/neodev.nvim",
        opts = {
          function()
            return {
              library = { plugins = { "nvim-dap-ui" }, types = true },
            }
          end,
        },
        config = function(_, opts)
          require("neodev").setup(opts)
        end,
      },
    },
    config = function()
      require "custom.configs.nvim-dap"
    end,
  },
  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
  },
  {
    -- grammar checking
    "rhysd/vim-grammarous",
  },
  --
  -- Rust
  --
  {
    -- format files on save
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    -- rust tools
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      {
        "rcarriga/nvim-dap-ui",
      },
      {
        "nvim-lua/plenary.nvim",
      },
    },
    opts = function()
      require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    -- cargo crates management
    "saecki/crates.nvim",
    dependencies = {
      -- required by saecki/crates.nvim
      "hrsh7th/nvim-cmp",
      opts = function()
        local M = require "plugins.configs.cmp"
        table.insert(M.sources, { name = "crates" })
        return M
      end,
    },

    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "https://github.com/adelarsq/image_preview.nvim",
    event = "VeryLazy",
    config = function()
      require("image_preview").setup()
    end,
  },
}

return plugins
