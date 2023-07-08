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

-- autosave on leaving a buffer
auto_cmd({ "BufLeave", "ExitPre", "CmdlineEnter", "ModeChanged", "WinLeave" }, {
  pattern = "*.*",
  command = "update",
})

auto_cmd({ "BufLeave", "WinLeave" }, {
  pattern = "*.*",
  command = "write",
})
