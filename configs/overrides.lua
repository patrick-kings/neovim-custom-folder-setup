local M = {}
M.nvim_treesitter = {
  {
    ensure_installed = {
      "rust",
      "vim",
      "lua",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "markdown",
      "tsx",
      "json",
      "toml",
      "yaml",
      "c",
      "zig",
      "python",
      "go",
      "dockerfile",
      "svelte",
      "vimdoc",
      "sql",
      "regex",
      "make",
      "cmake",
    },
  },
}

M.mason = {
  ensure_installed = {

    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "typescript-language-server",
    "deno",
    "html-lsp",
    "prettier",
    "svelte-language-server",

    -- rust
    "rust-analyzer",
    "codelldb",
    "rustfmt",

    -- golang
    "gopls",
    "gofumpt",
    "goimports",
    "goimports-reviser",
    "golines",
    "gomodifytags",

    -- c/cpp
    "clangd",
    "cpptools",
    "clang-format",

    -- toml
    "treefmt",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
