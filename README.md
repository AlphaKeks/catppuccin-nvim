<!-- panvimdoc-ignore-start -->

<h3 align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
	Catppuccin for <a href="https://github.com/neovim/neovim">NeoVim</a>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
    <a href="https://github.com/catppuccin/nvim/stargazers"><img src="https://img.shields.io/github/stars/catppuccin/nvim?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
    <a href="https://github.com/catppuccin/nvim/issues"><img src="https://img.shields.io/github/issues/catppuccin/nvim?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
    <a href="https://github.com/catppuccin/nvim/contributors"><img src="https://img.shields.io/github/contributors/catppuccin/nvim?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

![](https://raw.githubusercontent.com/catppuccin/nvim/assets/demo.png)

<!-- panvimdoc-ignore-end -->

# About

This port of Catppuccin is special because it was the first one and the one that originated the project itself. Given this, it's important to acknowledge that it all didn't come to be what it is now out of nowhere. So, if you are interested in knowing more about the initial stages of the theme, you can find it under the [`old-catppuccino`](https://github.com/catppuccin/nvim/tree/v0.1) tag.

# 🎁 Features

-   Handy CLI.
-   Extensible for many use cases.
-   [Compile](https://github.com/catppuccin/nvim#Compile) user config for faster startuptime
-   Integrations with [a bunch of plugins](https://github.com/catppuccin/nvim#integrations)

# Installation

You can use your favorite plugin manager for this. Here are some examples with the most popular ones:

#### Packer.nvim

```lua
use { "catppuccin/nvim", as = "catppuccin" }
```

#### Vim-plug

```vim
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
```

# Usage

For `lua`

```lua
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()

vim.cmd [[colorscheme catppuccin]]
```

For `vimscript`

```vim
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha

lua << EOF
require("catppuccin").setup()
EOF

colorscheme catppuccin
```

Remember that if you want to switch your Catppuccin flavour "on the fly" you may use the `:Catppuccin <flavour>` command.

> Note: the command has autocompletion enabled, so you can just press tab to cycle through the flavours

# Configuration

You may pass a lua table to the `setup()` function in order to edit any of Catppuccin's settings:

```lua
require("catppuccin").setup({
	transparent_background = false,
	term_colors = false,
	compile = {
		enabled = false,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		-- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
	},
	color_overrides = {},
	highlight_overrides = {},
})
```

Although settings already have self-explanatory names, here is where you can find info about each one of them and their classifications!

## General

This settings are unrelated to any group and are independent.

-   `transparent_background`: (Boolean) if true, disables setting the background color.
-   `term_colors`: (Boolean) if true, sets terminal colors (e.g. `g:terminal_color_0`).

## Dim inactive

This setting manages the ability to dim the inactive splits/windows/buffers displayed.

-   `enabled`: (Boolean) if true, dims the background color of inactive window or buffer or split.
-   `shade`: (string) sets the shade to apply to the inactive split or window or buffer.
-   `percentage`: (number 0 < x < 1) percentage of the shade to apply to the inactive window, split or buffer.

## Styles

Handles the style of general hi groups (see `:h highlight-args`):

-   `comments`: (Table) changed the style of the comments.
-   `functions`: (Table) changed the style of the functions.
-   `keywords`: (Table) changed the style of the keywords.
-   `strings`: (Table) changed the style of the strings.
-   `variables`: (Table) changed the style of the variables.

## Integrations

catppuccin-nvim provides theme support for other plugins in the Neovim ecosystem and extended Neovim functionality through _integrations_.

Below is a list of supported plugins and their corresponding integration module. (See [Special integrations](https://github.com/catppuccin/nvim#special-integrations) for more.)

| Plugin                                                                                | Module             |
| ------------------------------------------------------------------------------------- | ------------------ |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim)                                | aerial             |
| [barbar.nvim](https://github.com/romgrk/barbar.nvim)                                  | barbar             |
| [beacon.nvim](https://github.com/DanilaMihailov/beacon.nvim)                          | beacon             |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)                           | dashboard          |
| [fern.vim](https://github.com/lambdalisue/fern.vim)                                   | fern               |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                           | gitsigns           |
| [hop.nvim](https://github.com/phaazon/hop.nvim)                                       | hop                |
| [leap.nvim](https://github.com/ggandor/leap.nvim)                                     | leap               |
| [lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim)                         | lightspeed         |
| [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim/)                              | lsp_saga           |
| [markdown](https://www.markdownguide.org/)                                            | markdown           |
| [mini.nvim](https://github.com/echasnovski/mini.nvim)                                 | mini               |
| [neogit](https://github.com/TimUntersberger/neogit)                                   | neogit             |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                       | cmp                |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)                                | notify             |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)                          | nvimtree           |
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | treesitter_context |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                 | treesitter         |
| [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)                            | ts_rainbow         |
| [overseer.nvim](https://github.com/stevearc/overseer.nvim)                            | overseer           |
| [pounce.nvim](https://github.com/rlane/pounce.nvim)                                   | pounce             |
| [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)              | symbols_outline    |
| [telekasten.nvim](https://github.com/renerocksai/telekasten.nvim)                     | telekasten         |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                    | telescope          |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                                 | lsp_trouble        |
| [vim-gitgutter](https://github.com/airblade/vim-gitgutter)                            | gitgutter          |
| [vim-sneak](https://github.com/justinmk/vim-sneak)                                    | vim_sneak          |
| [vimwiki](https://github.com/vimwiki/vimwiki)                                         | vimwiki            |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                             | which_key          |

These integrations allow catppuccin to set the theme of various plugins. To enable an integration you just need to set it to `true`, for example:

```lua
require("catppuccin").setup({
	integrations = {
		<module> = <boolean>
	}
})
```

<details> <summary> <ins> Click here to see an example config </ins> </summary>

```lua
require("catppuccin").setup({
	integrations = {
		aerial = false,
		barbar = false,
		beacon = false,
		cmp = true,
		coc_nvim = false,
		dashboard = true,
		fern = false,
		fidget = false,
		gitgutter = false,
		gitsigns = true,
		hop = false,
		leap = false,
		lightspeed = false,
		lsp_saga = false,
		lsp_trouble = false,
		markdown = true,
		mini = false,
		neogit = false,
		notify = true,
		nvimtree = true,
		overseer = false,
		pounce = false,
		symbols_outline = false,
		telekasten = false,
		telescope = true,
		treesitter = true,
		treesitter_context = false,
		ts_rainbow = false,
		vim_sneak = false,
		vimwiki = false,
		which_key = false,

		-- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
		dap = {
			enabled = false,
			enable_ui = false,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		navic = {
			enabled = false,
			custom_bg = "NONE",
		},
		neotree = {
			enabled = false,
			show_root = true,
			transparent_panel = false,
		},
	},
})
```

</details>

### Special integrations

<details> <summary>bufferline.nvim</summary>

Update your bufferline config to use the Catppuccin components:

```lua
bufferline.setup { highlights = require("catppuccin.groups.integrations.bufferline").get() }
```

Configurations are self-explanatory, see `:h bufferline-highlights` for detailed explanation:

```lua
local mocha = require("catppuccin.palettes").get_palette "mocha"
bufferline.setup {
	highlights = require("catppuccin.groups.integrations.bufferline").get {
		styles = { "italic", "bold" },
		custom = {
			all = {
				fill = { bg = "#000000" },
			},
			mocha = {
				background = { fg = mocha.text },
			},
			latte = {
				background = { fg = "#000000" },
			},
		},
	},
}
```

</details>

<details> <summary>feline.nvim</summary>

First make sure that the [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons/) plugin is installed. Then update your Feline config to use the Catppuccin components:

```lua
local ctp_feline = require('catppuccin.groups.integrations.feline')

ctp_feline.setup()

require("feline").setup({
	components = ctp_feline.get(),
})
```

Notice that calling `setup()` is optional. You may pass a lua table in order to change assets, settings and the colors per vim mode.

<details>
    <summary>Here are the defaults</summary>
<p>

```lua
local clrs = require("catppuccin.palettes").get_palette()
assets = {
	left_separator = "",
	right_separator = "",
	bar = "█",
	mode_icon = "",
	dir = "  ",
	file = "   ",
	lsp = {
		server = "  ",
		error = "  ",
		warning = "  ",
		info = "  ",
		hint = "  ",
	},
	git = {
		branch = "  ",
		added = "  ",
		changed = "  ",
		removed = "  ",
	},
},
sett = {
	text = ucolors.vary_color({ latte = latte.base }, clrs.surface0),
	bkg = ucolors.vary_color({ latte = latte.crust }, clrs.surface0),
	diffs = clrs.mauve,
	extras = clrs.overlay1,
	curr_file = clrs.maroon,
	curr_dir = clrs.flamingo,
	show_modified = true -- show if the file has been modified
},
mode_colors = {
	["n"] = { "NORMAL", clrs.lavender },
	["no"] = { "N-PENDING", clrs.lavender },
	["i"] = { "INSERT", clrs.green },
	["ic"] = { "INSERT", clrs.green },
	["t"] = { "TERMINAL", clrs.green },
	["v"] = { "VISUAL", clrs.flamingo },
	["V"] = { "V-LINE", clrs.flamingo },
	[""] = { "V-BLOCK", clrs.flamingo },
	["R"] = { "REPLACE", clrs.maroon },
	["Rv"] = { "V-REPLACE", clrs.maroon },
	["s"] = { "SELECT", clrs.maroon },
	["S"] = { "S-LINE", clrs.maroon },
	[""] = { "S-BLOCK", clrs.maroon },
	["c"] = { "COMMAND", clrs.peach },
	["cv"] = { "COMMAND", clrs.peach },
	["ce"] = { "COMMAND", clrs.peach },
	["r"] = { "PROMPT", clrs.teal },
	["rm"] = { "MORE", clrs.teal },
	["r?"] = { "CONFIRM", clrs.mauve },
	["!"] = { "SHELL", clrs.green },
}
```

</p>
</details>
</details>

<details> <summary>fidget.nvim</summary>

Set fidget module to `true`

```lua
fidget = true
```

Then set `window.blend` to `0`:

```lua
require("fidget").setup {
    window = {
        blend = 0,
    },
	-- ... the rest of your fidget config
}
```

</details>

<details> <summary>indent-blankline.nvim</summary>

Setting `enabled` to `true` enables this integration. `colored_indent_levels` enables char highlights per indent level. Follow the instructions [here](https://github.com/lukas-reineke/indent-blankline.nvim#with-custom-gindent_blankline_char_highlight_list) to set the latter up.

```lua
indent_blankline = {
	enabled = true,
	colored_indent_levels = false,
},
```

</details>

<details> <summary>lightline.vim</summary>

Use this to set it up (Note: `catppuccin` is the only valid colorscheme name. It will pick the one set in your config):

```vim
let g:lightline = {'colorscheme': 'catppuccin'}
```

</details>

<details> <summary>lualine.nvim</summary>

Use this to set it up (Note: `catppuccin` is the only valid theme name. It will pick the one set in your config):

```lua
require('lualine').setup {
	options = {
		theme = "catppuccin"
		-- ... the rest of your lualine config
	}
}
```

</details>

<details> <summary>neo-tree.nvim</summary>

Setting `enabled` to `true` enables this integration:

```lua
integration = {
	neotree = {
		enabled = true,
		show_root = true, -- makes the root folder not transparent
		transparent_panel = false, -- make the panel transparent
	}
}
```

</details>

<details> <summary>nvim-dap</a> & nvim-dap-ui</a> </summary>

Setting `enabled` to `true`:

```lua
integration = {
	dap = {
		enabled = true,
		enable_ui = true, -- enable nvim-dap-ui
	}
}
```

```lua
-- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
require("dap")

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
```

</details>

<details> <summary>nvim-lspconfig</summary>

Setting `enabled` to `true` enables this integration. In the inners tables you can set the style for the diagnostics, both `virtual_text` (what you see on the side) and `underlines` (what points directly at the thing (e.g. an error)).

```lua
native_lsp = {
	enabled = true,
	virtual_text = {
		errors = { "italic" },
		hints = { "italic" },
		warnings = { "italic" },
		information = { "italic" },
	},
	underlines = {
		errors = { "underline" },
		hints = { "underline" },
		warnings = { "underline" },
		information = { "underline" },
	},
},
```

</details>

<details> <summary>nvim-navic</summary>

Setting `enabled` to `true`:

```lua
navic = {
	enabled = false,
	custom_bg = "NONE",
},
```

```lua
-- You NEED to enable highlight in nvim-navic setting or it won't work
require("nvim-navic").setup {
	highlight = true
}
```

</details>

<details> <summary>vim-clap</summary>

Use this to set it up:

```vim
let g:clap_theme = 'catppuccin'
```

</details>

If you'd like to know which highlight groups are being affected by catppuccin, check out this directory: [`lua/catppuccin/groups/integrations/`](https://github.com/catppuccin/nvim/tree/main/lua/catppuccin/groups/integrations).

# Customize highlights

## Get catppuccin colors

```lua
local latte = require("catppuccin.palettes").get_palette "latte"
local frappe = require("catppuccin.palettes").get_palette "frappe"
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local mocha = require("catppuccin.palettes").get_palette "mocha"

vim.g.catppuccin_flavour = "macchiato" -- Has to be set in order for empty argument to work
local colors = require("catppuccin.palettes").get_palette() -- g:catppuccin_flavour's palette
```

Will returns a table where the key is the name of the color and the value is its hex value.

## Overwriting highlight groups

Global highlight groups can be overwritten in the setting like so:

```lua
custom_highlights = {
	<hi_group> = { <fields> }
}
```

Here is an example:

```lua
vim.g.catppuccin_flavour = "macchiato"
local colors = require("catppuccin.palettes").get_palette() -- fetch colors from g:catppuccin_flavour palette
require("catppuccin").setup {
	custom_highlights = {
		Comment = { fg = colors.flamingo },
		TSConstBuiltin = { fg = colors.peach, style = {} },
		TSConstant = { fg = colors.sky },
		TSComment = { fg = colors.surface2, style = { "italic" } }
	}
}
```

Per flavour highlight groups can be overwritten in the setting like so:

```lua
highlight_overrides = {
	all = { -- Will be replaced with custom_highlights if it exists
		<hi_group> = { <fields> }
	}, -- Same for each flavour
	latte = {},
	frappe = {},
	macchiato = {},
	mocha = {},
}
```

Here is an example:

```lua
local ucolors = require "catppuccin.utils.colors"
local latte = require("catppuccin.palettes").get_palette "latte"
local frappe = require("catppuccin.palettes").get_palette "frappe"
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local mocha = require("catppuccin.palettes").get_palette "mocha"

vim.g.catppuccin_flavour = "macchiato"
local colors = require("catppuccin.palettes").get_palette() -- return vim.g.catppuccin_flavour palette

require("catppuccin").setup {
	highlight_overrides = {
		all = {
			CmpBorder = { fg = "#3e4145" },
		},
		latte = {
			Normal = { fg = ucolors.darken(latte.base, 0.7, latte.mantle) },
		},
		frappe = {
			TSConstBuiltin = { fg = frappe.peach, style = {} },
			TSConstant = { fg = frappe.sky },
			TSComment = { fg = frappe.surface2, style = { "italic" } },
		},
		macchiato = {
			LineNr = { fg = macchiato.overlay1 }
		},
		mocha = {
			Comment = { fg = mocha.flamingo },
		},
	},
}
```

Aditionally, if you want to load other custom highlights later, you may use this function:

```lua
require("catppuccin.lib.highlighter").syntax()
```

For example:

```lua
local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette
require("catppuccin.lib.highlighter").syntax({
	Comment = { fg = colors.surface0 }
})
```

> Note: custom highlights loaded using the `require("catppuccin.lib.highlighter").syntax()` function won't be pre-compiled. See [compile](https://github.com/catppuccin/nvim/tree/main#compile).

## Overwriting colors

Colors can be overwritten using `color_overrides` in the setting, like so:

```lua
require("catppuccin").setup {
	color_overrides = {
		all = {
			text = "#ffffff",
		},
		latte = {
			base = "#ff0000",
			mantle = "#242424",
			crust = "#474747",
		},
		frappe = {},
		macchiato = {},
		mocha = {},
	}
}
```

# Compile

Catppuccin is a highly customizable and configurable colorscheme. This does however come at the cost of complexity and execution time.

Catppuccin can pre compute the results of your configuration and store the results in a compiled lua file. We use these precached values to set it's highlights.

## Enable

Setting `enabled` to `true` enables this feature:

```lua
compile = {
	enabled = true,
	path = vim.fn.stdpath "cache" .. "/catppuccin"
}
```

By default catppuccin writes the compiled results into the system's cache directory.
Note: On windows we replace `/` with `\` by default

## Compile commands

```vim
:CatppuccinCompile " Create/update the compile file
:CatppuccinClean " Delete compiled file
:CatppuccinStatus " Compile status
```

NOTE: You have to reload setup function in order for compile to register new config. Please refer to [auto compile](https://github.com/catppuccin/nvim#auto-compile)

Catppuccin also provides these functions to work with the catppuccin compiler.

```lua
local catppuccin = require('catppuccin')

-- Create/update the compile files
catppuccin.compile()

-- Delete compiled files
catppuccin.clean()

-- Show compile status
catppuccin.status()
```

## Post-install/update hooks

Packer.nvim

```lua
-- It's recommended to add `:CatppuccinCompile` to post-install/update hooks
use {
	"catppuccin/nvim",
	as = "catppuccin",
	run = ":CatppuccinCompile"
}
```

Vim-plug

```lua
-- It's recommended to add `:CatppuccinCompile` to post-update hooks
Plug 'catppuccin/nvim', {'as': 'catppuccin', 'do': 'CatppuccinCompile'}
```

## Auto compile

Packer.nvim

```lua
-- If you want catppuccin setup function to actually reload without restarting nvim
require("packer").init {
	auto_reload_compiled = true
}
```

```lua
-- Create an autocmd User PackerCompileDone to update it every time packer is compiled
vim.api.nvim_create_autocmd("User", {
	pattern = "PackerCompileDone",
	callback = function()
		vim.cmd "CatppuccinCompile"
		vim.defer_fn(function()
			vim.cmd "colorscheme catppuccin"
		end, 0) -- Defered for live reloading
	end
})
```

```lua
-- PackerCompile on save if your config file is in plugins.lua or catppuccin.lua
-- DO NOT put the autocmd inside the plugin specification file or you will get 2 ^ x files open after x saves
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "plugins.lua", "catppuccin.lua" },
	callback = function()
		vim.cmd "PackerCompile"
	end
})
```

Vim-plug

```vim
" Auto reload on save if catppuccin config is written inside init.vim
autocmd BufWritePost init.vim :source init.vim | CatppuccinCompile
```

## Acknowledge

[nightfox.nvim#compile](https://github.com/EdenEast/nightfox.nvim#compile)

## Hooks

Use them to execute code at certain events. These are the ones available:

| Autocmd          | Description                  |
| ---------------- | ---------------------------- |
| `ColorSchemePre` | Before loading a colorscheme |
| `ColorScheme`    | After loading a colorscheme  |

They can be used like so:

```lua
vim.api.nvim_create_autocmd("ColorSchemePre", {
	pattern = "*",
	callback = function()
		print "I ran before loading Catppuccin!"
	end
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local colors = require("catppuccin.palettes").get_palette()
		-- do something with colors
	end
})
```

# FAQ

## Transparent background tweaks

Add this to `custom_highlights` settings

```lua
local colors = require("catppuccin.palettes").get_palette()
colors.none = "NONE"
require("catppuccin").setup {
	custom_highlights = {
		Comment = { fg = colors.overlay1 },
		LineNr = { fg = colors.overlay1 },
		CursorLine = { bg = colors.none },
		CursorLineNr = { fg = colors.lavender },
		DiagnosticVirtualTextError = { bg = colors.none },
		DiagnosticVirtualTextWarn = { bg = colors.none },
		DiagnosticVirtualTextInfo = { bg = colors.none },
		DiagnosticVirtualTextHint = { bg = colors.none },
	}
}
```

## Usage with :set background

The following autocmd will change the flavour to latte when you `:set background=light` and to mocha after `:set background=dark`

```lua
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		vim.cmd("Catppuccin " .. (vim.v.option_new == "light" and "latte" or "mocha"))
	end,
})
```

For people who are hybrid between light and dark mode!

## Catppuccin remap function

Unlike the `:highlight` command which can update a highlight group, this function completely replaces the definition. (`:h nvim_set_hl`)

```lua
require("catppuccin.lib.highlighter").syntax({
	Normal = { style = { "italic", "bold" } }
})
```

## Wrong treesitter highlights after :set spell

Please disable `additional_vim_regex_highlighting`

```lua
require("nvim-treesitter.configs").setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
}
```

# 💝 Thanks to

-   [Pocco81](https://github.com/Pocco81)
-   [Null Chilly](https://github.com/nullchilly)

<!-- panvimdoc-ignore-start -->

&nbsp;

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
<p align="center"><a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>

<!-- panvimdoc-ignore-end -->
