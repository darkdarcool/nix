{ config, pkgs, inputs, ... }:

{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>NvimTreeFocus<CR>";
      key = "<leader>f";
    }
    {
      action = "<cmd>Lspsaga hover_doc<CR>";
      key = "<leader>d";
    }
    {
      action = "<cmd>Lspsaga goto_definition<CR>";
      key = "<leader>D";
    }
    # TODO: Add Ctrl + F for search
    # vim.keymap.set('n', '<C-f>', '<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Search for: ") })<CR>')
  ];
}
