local auto_cmd = vim.api.nvim_create_autocmd

auto_cmd({ "VimEnter" }, {
  pattern = "*",
  command = "NvimTreeToggle",
})
