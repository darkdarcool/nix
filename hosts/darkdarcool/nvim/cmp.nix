{ config, lib, pkgs, inputs, ... }:

{
  programs.nixvim.plugins.lspkind = {
    enable = true;

    cmp = {
      enable = true;
      after = ''
        	function(entry, vim_after, kind)
        	  local strings = vim.split(kind.kind, "%s", { trimempty = true })
                  kind.kind = " " .. (strings[1] or "") .. " "
                  kind.menu = "    (" .. (strings[2] or "") .. ")"
                  return kind
                end
      '';
    };

    extraOptions = {
      symbol_map = {
        Text = "󰉿";
        Method = "󰆧";
        Function = "󰊕";
        Constructor = "";
        Field = "󰜢";
        Variable = "󰀫";
        Class = "󰠱";
        Interface = "";
        Module = "";
        Property = "󰜢";
        Unit = "󰑭";
        Value = "󰎠";
        Enum = "";
        Keyword = "󰌋";
        Snippet = "";
        Color = "󰏘";
        File = "󰈙";
        Reference = "󰈇";
        Folder = "󰉋";
        EnumMember = "";
        Constant = "󰏿";
        Struct = "󰙅";
        Event = "";
        Operator = "󰆕";
        TypeParameter = "";
        Copilot = "";
      };

    };
  };

  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;

    settings = {
      mapping = {
        "<Tab>" = "cmp.mapping.confirm({ select = false })";
        "<CR>" =
          "		function(fallback)\n			if cmp.visible() then\n				cmp.select_next_item()\n			else \n				fallback()\n			end\n		end\n";
      };

      sources = [
        #{ name = "copilot"; }
        { name = "nvim_lsp"; }
        { name = "otter"; }
        { name = "nvim_lua"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
      ];
    };

    extraOptions = {
      completion = { completeopt = "menu,menuone,noinsert"; };
      window = {
        documentation = {
          # border = "solid";
          border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          # winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None";
        };
        completion = {
          side_padding = 0;
          border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          winhighlight =
            "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None";
        };
      };
      formatting = {
        fields = [ "kind" "abbr" "menu" ];
        # This gets overwritten by plugins.lspkind.cmp.after
        #format = lib.mkDefault ''
        #	function(entry, vim_item)
        #		local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
        #		local strings = vim.split(kind.kind, "%s", { trimempty = true })
        #		kind.kind = " " .. (strings[1] or "") .. " "
        #		kind.menu = "    (" .. (strings[2] or "") .. ")"
        #		return kind
        #	end
        #'';
      };

      snippet.expand = "luasnip";
    };

    # Completions on the nvim cmdline 
    cmdline = {
      ":" = {
        mapping = { __raw = "cmp.mapping.preset.cmdline()"; };

        sources = [ { name = "path"; } { name = "cmdline"; } ];
      };
    };
  };

}
