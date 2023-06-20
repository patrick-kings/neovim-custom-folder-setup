local auto_cmd = vim.api.nvim_create_autocmd

-- open nvim tree when vim starts
auto_cmd({ "VimEnter" }, {
  pattern = "*",
  command = "NvimTreeToggle",
})

-- autosave on leaving a buffer
auto_cmd({ "BufLeave", "ExitPre" }, {
  pattern = "*",
  command = "update",
})
