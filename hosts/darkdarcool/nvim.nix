{ config, pkgs, ... }:

{
  imports = [
    ./nvim/lsp.nix
    ./nvim/cmp.nix
    ./nvim/tree.nix
    ./nvim/presence.nix
    ./nvim/treesitter.nix
    ./nvim/keymaps.nix
    ./nvim/lualine.nix
    ./nvim/noice.nix
    ./nvim/lspsaga.nix
    ./nvim/autosave.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.oxocarbon.enable = true;

    options = {
      number = true;
      shiftwidth = 2;
    };

    # Map leader to SPACE
    globals.mapleader = " ";

    extraConfigLua = '' 
            vim.api.nvim_create_autocmd("QuitPre", {
      	callback = function()
              local tree_wins = {}
              local floating_wins = {}
              local wins = vim.api.nvim_list_wins()
              for _, w in ipairs(wins) do
      	  local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
                if bufname:match("NvimTree_") ~= nil then
      	    table.insert(tree_wins, w)
                end
                if vim.api.nvim_win_get_config(w).relative ~= "" then
      	    table.insert(floating_wins, w)
                end
              end
              if 1 == #wins - #floating_wins - #tree_wins then
      	  -- Should quit, so we close all invalid windows.
                for _, w in ipairs(tree_wins) do
      	    vim.api.nvim_win_close(w, true)
      	  end
              end
            end
            })
            
      
            vim.opt.signcolumn = "no"

            require('diagflow').setup({
      	enable = true,
      	max_width = 60,  -- The maximum width of the diagnostic messages
      	max_height = 10, -- the maximum height per diagnostics
      	  severity_colors = {  -- The highlight groups to use for each diagnostic severity level
      	    error = "DiagnosticFloatingError",
      	    warning = "DiagnosticFloatingWarn",
      	    info = "DiagnosticFloatingInfo",
      	    hint = "DiagnosticFloatingHint",
      	},
      	format = function(diagnostic)
      	  return diagnostic.message
      	end,
      	gap_size = 1,
      	scope = 'line', -- 'cursor', 'line' this changes the scope, so instead of showing errors under the cursor, it shows errors on the entire line.
      	padding_top = 0,
      	padding_right = 0,
      	text_align = 'right', -- 'left', 'right'
      	placement = 'top', -- 'top', 'inline'
      	inline_padding_left = 0, -- the padding left when the placement is inline
      	update_event = { 'DiagnosticChanged', 'BufReadPost' }, -- the event that updates the diagnostics cache
      	toggle_event = { }, -- if InsertEnter, can toggle the diagnostics on inserts
      	show_sign = false, -- set to true if you want to render the diagnostic sign before the diagnostic message
      	render_event = { 'DiagnosticChanged', 'CursorMoved' },
      	border_chars = {
      	  top_left = "╭",
      	  top_right = "╮",
      	  bottom_left = "╰",
      	  bottom_right = "╯",
      	  horizontal = "─",
      	  vertical = "│"
      	},
      	show_borders = true,
            })
    '';

    plugins = {
      copilot-vim.enable = true;
      copilot-cmp.enable = false;
      cmp-cmdline.enable = true;
      lsp-format.enable = true;
      luasnip.enable = true;
    };

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "diagflow";
        src = pkgs.fetchFromGitHub {
          owner = "dgagn";
          repo = "diagflow.nvim";
          rev = "6d2ad945ddbc46f42a0a2e7618975a5f3d2e7dbe";
          hash = "sha256-6TeCbJV74kgm9yslPQp1k4KQv+FB+qHe5UVZN3adjko=";
        };
      })
    ];
  };
}
