local M = {}
M.nvim_treesitter = {

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
    "jsonc",
    "java",
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

  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {

    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "ts-standard",
    "deno",
    "html-lsp",
    "prettier",
    "tailwindcss-language-server",

    -- rust
    "rust-analyzer",
    "codelldb",

    -- golang
    "gopls",
    "gofumpt",
    "goimports",
    "goimports-reviser",
    "golines",
    "gomodifytags",
    "go-debug-adapter",

    -- c/cpp
    "clangd",
    "cpptools",
    "clang-format",
    "cmake-language-server",
    "cmakelang",
    "cmakelint",
    "cpplint",

    "sqlfmt",

    "yaml-language-server",

    "bash-language-server"
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
