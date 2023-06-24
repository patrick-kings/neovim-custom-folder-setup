local auto_cmd = vim.api.nvim_create_autocmd

-- open nvim tree when vim starts
auto_cmd({ "VimEnter" }, {
  pattern = "*",
  command = "NvimTreeToggle",
})

-- format rust files
auto_cmd({ "InsertLeave", "BufLeave", "ExitPre" }, {
  pattern = "*.rs",
  command = "RustFmt",
})

-- autosave on leaving a buffer
auto_cmd({ "BufLeave", "ExitPre" }, {
  pattern = "*.*",
  command = "write",
})
