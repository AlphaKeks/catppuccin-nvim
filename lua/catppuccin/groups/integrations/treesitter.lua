local M = {}

-- neovim 0.8 compatibility
vim.g.skip_ts_default_groups = true

function M.get()
	-- local delimeters = cp.overlay2
	local operators = cp.peach
	local cl = cp.sapphire -- conditionals, loops
	local keywords = cp.mauve

	local math_logic = cp.peach

	if not vim.treesitter.highlighter.hl_map then -- https://github.com/nvim-treesitter/nvim-treesitter/pull/3365
		return {
			-- These groups are for the neovim tree-sitter highlights.
			-- As of writing, tree-sitter support is a WIP, group names may change.
			-- By default, most of these groups link to an appropriate Vim group,
			-- TSError -> Error for example, so you do not have to define these unless
			-- you explicitly want to support Treesitter's improved syntax awareness.
			["@field"] = { fg = cp.lavender }, -- For fields.
			["@property"] = { fg = cp.lavender, style = cnf.styles.properties or {} }, -- Same as TSField.

			["@include"] = { fg = cp.overlay0, style = cnf.styles.keywords or {} }, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
			["@operator"] = { fg = operators, style = cnf.styles.operators or {} }, -- For any operator: +, but also -> and * in cp.
			["@keyword.operator"] = { fg = cp.mauve, style = cnf.styles.operators or {} }, -- For new keyword operator
			["@punctuation.special"] = { fg = cp.teal, style = cnf.styles.operators or {} }, -- For special punctutation that does not fall in the catagories before.

			["@float"] = { fg = math_logic, style = cnf.styles.numbers or {} }, -- For floats.
			["@number"] = { fg = math_logic, style = cnf.styles.numbers or {} }, -- For all numbers
			["@boolean"] = { fg = math_logic, style = cnf.styles.booleans or {} }, -- For booleans.

			["@constructor"] = { fg = cp.sapphire }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
			["@constant"] = { fg = cp.red }, -- For constants
			["@conditional"] = { fg = cl, style = cnf.styles.conditionals or {} }, -- For keywords related to conditionnals.
			["@repeat"] = { fg = cl, style = cnf.styles.loops or {} }, -- For keywords related to loops.
			["@exception"] = { fg = cp.red, style = cnf.styles.keywords or {} }, -- For exception related keywords.

			-- builtin
			["@constant.builtin"] = { fg = cp.maroon, style = cnf.styles.keywords or {} }, -- For constant that are built in the language: nil in Lua.
			["@function.builtin"] = { fg = cp.maroon, style = cnf.styles.functions or {} }, -- For builtin functions: table.insert in Lua.

			["@namespace"] = { fg = cp.mauve, style = { "italic" } }, -- For identifiers referring to modules and namespaces.
			["@type"] = { fg = cp.sky, style = cnf.styles.types or {} }, -- For types.
			["@type.builtin"] = { fg = cp.sky, style = cnf.styles.properties or "italic" }, -- For builtin types.
			["@variable.builtin"] = { fg = cp.maroon }, -- Variable names that are defined by the languages, like this or self.

			["@function"] = { fg = cp.mauve, style = cnf.styles.functions or {} }, -- For function (calls and definitions).
			["@function.macro"] = { fg = cp.mauve, style = cnf.styles.functions or {} }, -- For macro defined functions (calls and definitions): each macro_rules in Ruscp.
			["@parameter"] = { fg = cp.lavender, style = { "italic" } }, -- For parameters of a function.
			["@keyword.function"] = { fg = cp.sapphire, style = cnf.styles.keywords or {} }, -- For keywords used to define a fuction.
			["@keyword"] = { fg = keywords, style = cnf.styles.keywords or {} }, -- For keywords that don't fall in previous categories.
			["@keyword.return"] = { fg = cp.sapphire, style = cnf.styles.keywords or {} },
			-- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
			-- TSAttribute         = { };    -- (unstable) TODO: docs
			-- TSCharacter         = { };    -- For characters.
			-- TSoverlay0           = { };    -- For overlay0 blocks.
			["@text.note"] = { fg = cp.base, bg = cp.blue },
			["@text.warning"] = { fg = cp.base, bg = cp.yellow },
			["@text.danger"] = { fg = cp.base, bg = cp.red },
			["@constant.macro"] = { fg = cp.sapphire }, -- For constants that are defined by macros: NULL in cp.
			-- TSError = { fg = cp.red }, -- For syntax/parser errors.
			-- rustTSField = { fg = cp.surface1 }, -- For fields.
			["@label"] = { fg = cp.mauve }, -- For labels: label: in C and :label: in Lua.
			["@method"] = { fg = cp.blue, style = cnf.styles.functions or {} }, -- For method calls and definitions.
			-- TSNone              = { };    -- TODO: docs
			-- TSParameterReference= { };    -- For references to parameters of a function.
			["@punctuation.delimiter"] = { fg = cp.teal }, -- For delimiters ie: .
			-- TSPunctBracket = { fg = delimeters }, -- For brackets and parenthesis.
			["@punctuation.bracket"] = { fg = cp.blue }, -- For brackets and parenthesis.
			["@string"] = { fg = cp.lavender, style = cnf.styles.strings or {} }, -- For strings.
			["@string.regex"] = { fg = cp.pink, style = cnf.styles.strings or {} }, -- For regexes.
			-- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
			["@variable"] = { fg = cp.sky, style = cnf.styles.variables or {} }, -- Any variable name that does not have another highlighcp.
			["@tag.attribute"] = { fg = cp.teal, style = { "italic" } }, -- Tags like html tag names.
			["@tag"] = { fg = cp.sapphire }, -- Tags like html tag names.
			["@tag.delimiter"] = { fg = cp.sky }, -- Tag delimiter like < > /
			["@text"] = { fg = cp.text }, -- For strings considerated text in a markup language.
			-- TSEmphasis          = { };    -- For text to be represented with emphasis.
			-- TSUnderline         = { };    -- For text to be represented with an underline.
			-- TSStrike            = { };    -- For strikethrough texcp.
			-- TSTitle             = { };    -- Text that is part of a title.
			-- TSLiteral           = { };    -- Literal texcp.
			-- TSURI               = { };    -- Any URI like a link or email.
			--
			-- Markdown tresitter parser support
			["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } }, -- urls, links and emails
			["@text.literal"] = { fg = cp.teal, style = { "italic" } }, -- used for inline code in markdown and for doc in python (""")
			["@text.reference"] = { fg = cp.lavender, style = { "bold" } }, -- references
			["@text.title"] = { fg = cp.blue, style = { "bold" } }, -- titles like: # Example
			["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } }, -- bold
			["@text.strong"] = { fg = cp.maroon, style = { "bold" } }, -- italic
			["@string.escape"] = { fg = cp.yellow, style = cnf.styles.strings }, -- For escape characters within a string.

			-- bash
			-- bashTSFuncBuiltin = { fg = cp.red, style = { "italic" } },
			-- bashTSParameter = { fg = cp.yellow, style = { "italic" } },

			tomlTSProperty = { fg = cp.blue }, -- Differentiates between string and properties

			-- json
			jsonTSLabel = { fg = cp.blue }, -- For labels: label: in C and :label: in Lua.

			-- lua
			luaTSConstructor = { fg = cp.lavender }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.

			-- typescript
			typescriptTSConstructor = { fg = cp.sapphire },

			-- TSX (Typescript React)
			tsxTSConstructor = { fg = cp.lavender },
			tsxTSTagAttribute = { fg = cp.mauve },

			-- cpp
			cppTSProperty = { fg = cp.rosewater },

			-- yaml
			yamlTSField = { fg = cp.blue }, -- For fields.
		}
	else -- neovim <= 0.7.2
		return {
			-- These groups are for the neovim tree-sitter highlights.
			-- As of writing, tree-sitter support is a WIP, group names may change.
			-- By default, most of these groups link to an appropriate Vim group,
			-- TSError -> Error for example, so you do not have to define these unless
			-- you explicitly want to support Treesitter's improved syntax awareness.
			TSField = { fg = cp.lavender }, -- For fields.
			TSProperty = { fg = cp.lavender, style = cnf.styles.properties or {} }, -- Same as TSField.

			TSInclude = { fg = cp.overlay0, style = cnf.styles.keywords or {} }, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
			TSOperator = { fg = operators, style = cnf.styles.operators or {} }, -- For any operator: +, but also -> and * in cp.
			TSKeywordOperator = { fg = cp.mauve, style = cnf.styles.operators or {} }, -- For new keyword operator
			TSPunctSpecial = { fg = cp.teal, style = cnf.styles.operators or {} }, -- For special punctutation that does not fall in the catagories before.

			TSFloat = { fg = math_logic, style = cnf.styles.numbers or {} }, -- For floats.
			TSNumber = { fg = math_logic, style = cnf.styles.numbers or {} }, -- For all numbers
			TSBoolean = { fg = math_logic, style = cnf.styles.booleans or {} }, -- For booleans.

			TSConstructor = { fg = cp.sapphire }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
			TSConstant = { fg = cp.red }, -- For constants
			TSConditional = { fg = cl, style = cnf.styles.conditionals or {} }, -- For keywords related to conditionnals.
			TSRepeat = { fg = cl, style = cnf.styles.loops or {} }, -- For keywords related to loops.
			TSException = { fg = cp.red, style = cnf.styles.keywords or {} }, -- For exception related keywords.

			-- builtin
			TSConstBuiltin = { fg = cp.maroon, style = cnf.styles.keywords or {} }, -- For constant that are built in the language: nil in Lua.
			TSFuncBuiltin = { fg = cp.maroon, style = cnf.styles.functions or {} }, -- For builtin functions: table.insert in Lua.

			TSNamespace = { fg = cp.mauve, style = { "italic" } }, -- For identifiers referring to modules and namespaces.
			TSType = { fg = cp.sky, style = cnf.styles.types or {} }, -- For types.
			TSTypeBuiltin = { fg = cp.sky, style = cnf.styles.properties or "italic" }, -- For builtin types.
			TSVariableBuiltin = { fg = cp.maroon }, -- Variable names that are defined by the languages, like this or self.

			TSFunction = { fg = cp.mauve, style = cnf.styles.functions or {} }, -- For function (calls and definitions).
			TSFuncMacro = { fg = cp.mauve, style = cnf.styles.functions or {} }, -- For macro defined functions (calls and definitions): each macro_rules in Ruscp.
			TSParameter = { fg = cp.lavender, style = { "italic" } }, -- For parameters of a function.
			TSKeywordFunction = { fg = cp.sapphire, style = cnf.styles.keywords or {} }, -- For keywords used to define a fuction.
			TSKeyword = { fg = keywords, style = cnf.styles.keywords or {} }, -- For keywords that don't fall in previous categories.
			TSKeywordReturn = { fg = cp.sapphire, style = cnf.styles.keywords or {} },
			-- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
			-- TSAttribute         = { };    -- (unstable) TODO: docs
			-- TSCharacter         = { };    -- For characters.
			-- TSoverlay0           = { };    -- For overlay0 blocks.
			TSNote = { fg = cp.base, bg = cp.blue },
			TSWarning = { fg = cp.base, bg = cp.yellow },
			TSDanger = { fg = cp.base, bg = cp.red },
			TSConstMacro = { fg = cp.sapphire }, -- For constants that are defined by macros: NULL in cp.
			-- TSError = { fg = cp.red }, -- For syntax/parser errors.
			-- rustTSField = { fg = cp.surface1 }, -- For fields.
			TSLabel = { fg = cp.mauve }, -- For labels: label: in C and :label: in Lua.
			TSMethod = { fg = cp.blue, style = cnf.styles.functions or {} }, -- For method calls and definitions.
			-- TSNone              = { };    -- TODO: docs
			-- TSParameterReference= { };    -- For references to parameters of a function.
			tomlTSProperty = { fg = cp.blue }, -- Differentiates between string and properties
			TSPunctDelimiter = { fg = cp.teal }, -- For delimiters ie: .
			-- TSPunctBracket = { fg = delimeters }, -- For brackets and parenthesis.
			TSPunctBracket = { fg = cp.blue }, -- For brackets and parenthesis.
			TSString = { fg = cp.lavender, style = cnf.styles.strings or {} }, -- For strings.
			TSStringRegex = { fg = cp.pink, style = cnf.styles.strings or {} }, -- For regexes.
			-- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
			TSVariable = { fg = cp.sky, style = cnf.styles.variables or {} }, -- Any variable name that does not have another highlighcp.
			TSTagAttribute = { fg = cp.teal, style = { "italic" } }, -- Tags like html tag names.
			TSTag = { fg = cp.sapphire }, -- Tags like html tag names.
			TSTagDelimiter = { fg = cp.sky }, -- Tag delimiter like < > /
			TSText = { fg = cp.text }, -- For strings considerated text in a markup language.
			-- TSEmphasis          = { };    -- For text to be represented with emphasis.
			-- TSUnderline         = { };    -- For text to be represented with an underline.
			-- TSStrike            = { };    -- For strikethrough texcp.
			-- TSTitle             = { };    -- Text that is part of a title.
			-- TSLiteral           = { };    -- Literal texcp.
			-- TSURI               = { };    -- Any URI like a link or email.
			--
			-- Markdown tresitter parser support
			TSURI = { fg = cp.rosewater, style = { "italic", "underline" } }, -- urls, links and emails
			TSLiteral = { fg = cp.teal, style = { "italic" } }, -- used for inline code in markdown and for doc in python (""")
			TSTextReference = { fg = cp.lavender, style = { "bold" } }, -- references
			TSTitle = { fg = cp.blue, style = { "bold" } }, -- titles like: # Example
			TSEmphasis = { fg = cp.maroon, style = { "italic" } }, -- bold
			TSStrong = { fg = cp.maroon, style = { "bold" } }, -- italic
			TSStringEscape = { fg = cp.yellow, style = cnf.styles.strings }, -- For escape characters within a string.

			-- bash
			-- bashTSFuncBuiltin = { fg = cp.red, style = { "italic" } },
			-- bashTSParameter = { fg = cp.yellow, style = { "italic" } },

			-- json
			jsonTSLabel = { fg = cp.blue }, -- For labels: label: in C and :label: in Lua.

			-- lua
			luaTSConstructor = { fg = cp.lavender }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.

			-- typescript
			typescriptTSConstructor = { fg = cp.sapphire },

			-- TSX (Typescript React)
			tsxTSConstructor = { fg = cp.lavender },
			tsxTSTagAttribute = { fg = cp.mauve },

			-- cpp
			cppTSProperty = { fg = cp.rosewater },

			-- yaml
			yamlTSField = { fg = cp.blue }, -- For fields.
		}
	end
end

return M
