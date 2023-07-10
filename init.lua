local auto_cmd = vim.api.nvim_create_autocmd

-- open nvim tree when vim starts
auto_cmd({ "VimEnter" }, {
  pattern = "*",
  command = "NvimTreeToggle",
})

-- format rust files
auto_cmd({ "BufWritePre" }, {
  pattern = "*.rs",
  command = "RustFmt",
})

auto_cmd({
  "FocusLost",
  "BufLeave",
}, {
  pattern = "*.*",
  command = "write",
})
