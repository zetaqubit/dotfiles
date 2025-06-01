return {
  'assistcontrol/readline.nvim',
  config = function()
    local readline = require('readline')
    local map = vim.keymap.set
    map({"i", "c"}, '<M-f>', readline.forward_word)
    map({"i", "c"}, '<M-b>', readline.backward_word)
    map({"i", "c"}, '<M-d>', readline.kill_word)
    map({"i", "c"}, '<M-BS>', readline.backward_kill_word)
    map({"i", "c"}, '<C-w>', readline.unix_word_rubout)
    map({"i", "c"}, '<C-k>', readline.kill_line)
    map({"i", "c"}, '<C-u>', readline.backward_kill_line)
    -- map({"i", "c"}, '<C-a>', readline.beginning_of_line)
    -- map({"i", "c"}, '<C-e>', readline.end_of_line)
  end,
}
