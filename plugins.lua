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
  -- debugging -----------------------
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      "mfussenegger/nvim-dap",
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
    config = function()
      require("vim-grammarous").setup()
    end,
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
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("typescript-tools").setup()
    end,
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    config = true,
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
    config = true,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    build = function()
      if not require("nvim-treesitter.parsers").has_parser "dap_repl" then
        vim.cmd ":TSInstall dap_repl"
      end
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
}

return plugins
