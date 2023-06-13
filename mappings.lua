---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- more keybinds!

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

M.rust_tools = {
  n = {
    ["<C-space>"] = {
      function()
        require("rust-tools").hover_actions.hover_actions()
      end,
      "hover actions",
    },
    ["<leader>a"] = {
      function()
        require("rust-tools").code_action_group.code_action_group()
      end,
      "code action group",
    },
  },
}

M.debug = {

  n = {
    ["<leader>tb"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "toggle breakpoint",
    },
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "continue",
    },

    ["<F3>"] = {
      function()
        require("dap").step_over()
      end,
      "step over",
    },
    ["<F2>"] = {
      function()
        require("dap").step_into()
      end,
      "step into",
    },
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
      "step out",
    },
    ["<leader>tr"] = {
      function()
        require("dap").repl.open()
      end,
      "open repl",
    },
    ["<leader>tt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "debug go test",
    },
    ["<leader>to"] = {
      function()
        require("dapui").open()
      end,
      "open dap ui",
    },
  },
}
return M
