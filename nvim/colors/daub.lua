local colors = dofile(os.getenv("HOME") .. "/.config/daub/gen/colors.lua")
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- stylua: ignore start
-- =============================================
-- Core UI Elements
-- =============================================
hi("Normal",       { fg = colors.lv05, bg = colors.lv00 })
hi("NormalFloat",  { fg = colors.lv05, bg = colors.lv01 })
hi("StatusLine",   { fg = colors.lv05, bg = colors.lv01 })
hi("StatusLineNC", { fg = colors.lv03, bg = colors.lv01 })
hi("Search",       { fg = colors.lv05, bg = colors.lv02 })
hi("CurSearch",    { fg = colors.lv01, bg = colors.clyl })
hi("IncSearch",    { fg = colors.lv01, bg = colors.clcy })
hi("CursorLine",   { bg = colors.lv01 })
hi("Visual",       { bg = colors.lv02 })
hi("LineNr",       { fg = colors.lv03 })
hi("CursorLineNr", { fg = colors.clyl })
hi("Title",        { fg = colors.clbl })
hi("WinSeparator", { fg = colors.lv02 })
hi("EndOfBuffer",  { fg = colors.lv00 })

-- =============================================
-- Basic Syntax Highlighting
-- =============================================
-- Comments and documentation
hi("Comment", { fg = colors.lv04, italic = true })

-- Constants
hi("Constant",  { fg = colors.clor  })
hi("String",    { fg = colors.clgn  })
hi("Character", { fg = colors.clrd  })
hi("Number",    { link = "Constant" })
hi("Boolean",   { link = "Constant" })
hi("Float",     { link = "Constant" })

-- Identifiers
hi("Identifier", { fg = colors.lv05 })
hi("Function",   { fg = colors.clbl })
hi("Operator",   { fg = colors.lv05 })

-- Control flow and statements
hi("Keyword",     { fg = colors.clmg })
hi("Label",       { fg = colors.clyl })
hi("Exception",   { fg = colors.clrd })
hi("Statement",   { link = "Keyword" })
hi("Conditional", { link = "Keyword" })
hi("Repeat",      { link = "Keyword" })

-- Preprocessor directives
hi("Macro",     { fg = colors.clbl })
hi("PreProc",   { link = "Type"    })
hi("PreCondit", { link = "Type"    })
hi("Include",   { link = "Keyword" })
hi("Define",    { link = "Keyword" })

-- Type definitions
hi("Type",         { fg = colors.clyl })
hi("StorageClass", { link = "Type"    })
hi("Structure",    { link = "Type"    })
hi("Typedef",      { link = "Type"    })

-- Special elements
hi("Delimiter",      { fg = colors.lv05 })
hi("Tag",            { fg = colors.clyl })
hi("Debug",          { fg = colors.clrd })
hi("Special",        { fg = colors.clbn })
hi("SpecialChar",    { link = "Special" })
hi("SpecialComment", { link = "Special" })

-- Spell
hi("SpellBad",   { sp = colors.clrd, undercurl = true })
hi("SpellCap",   { sp = colors.clyl, undercurl = true })
hi("SpellRare",  { sp = colors.clcy, undercurl = true })
hi("SpellLocal", { sp = colors.clgn, undercurl = true })

-- =============================================
-- Text Formatting and Error States
-- =============================================
hi("Ignore",     { fg = colors.lv00 })
hi("Bold",       { bold = true      })
hi("Italic",     { italic = true    })
hi("Underlined", { fg = colors.clrd, underline = true })
hi("Error",      { fg = colors.lv00, bg = colors.clrd })
hi("Todo",       { fg = colors.clyl, bg = colors.lv01, bold = true })

-- =============================================
-- UI Components and Feedback
-- =============================================
hi("Directory",    { fg = colors.clbl })
hi("Question",     { fg = colors.clbl })
hi("SpecialKey",   { fg = colors.lv03 })
hi("TooLong",      { fg = colors.clrd })
hi("VisualNOS",    { fg = colors.clrd })
hi("WarningMsg",   { fg = colors.clrd })
hi("NonText",      { fg = colors.lv03 })
hi("SignColumn",   { fg = colors.lv03 })
hi("ColorColumn",  { bg = colors.lv01 })
hi("CursorColumn", { bg = colors.lv01 })
hi("ModeMsg",      { fg = colors.lv05, bold = true })
hi("MoreMsg",      { fg = colors.lv05, bold = true })
hi("Substitute",   { fg = colors.lv01, bg = colors.clyl })
hi("WildMenu",     { fg = colors.clrd, bg = colors.clyl })
hi("Conceal",      { fg = colors.clbl, bg = colors.lv00 })
hi("Cursor",       { fg = colors.lv00, bg = colors.lv05 })
hi("QuickFixLine", { fg = colors.clyl, bg = colors.lv01 })
hi("ErrorMsg",     { fg = colors.clrd, bg = colors.lv00 })
hi("FoldColumn",   { fg = colors.clcy, bg = colors.lv01 })
hi("Folded",       { fg = colors.lv03, bg = colors.lv01 })
hi("MatchParen",   { fg = colors.clor, bg = colors.lv02, bold = true })

-- =============================================
-- Diff
-- =============================================
hi("Added",      { fg = colors.clgn })
hi("Changed",    { fg = colors.clyl })
hi("Removed",    { fg = colors.clrd })
hi("DiffAdd",    { fg = colors.clgn })
hi("DiffChange", { fg = colors.clyl })
hi("DiffDelete", { fg = colors.clrd })
hi("DiffText",   { fg = colors.clcy })

-- =============================================
-- Menus and Navigation
-- =============================================
hi("PMenuThumb",  { bg = colors.lv02 })
hi("PMenu",       { fg = colors.lv05, bg = colors.lv01 })
hi("PMenuSel",    { fg = colors.lv05, bg = colors.lv01 })
hi("TabLine",     { fg = colors.lv03, bg = colors.lv01 })
hi("TabLineFill", { fg = colors.lv03, bg = colors.lv01 })
hi("TabLineSel",  { fg = colors.lv04, bg = colors.lv01 })

-- =============================================
-- Mini Status Line
-- =============================================
hi("MiniStatuslineModeNormal",  { fg = colors.lv01, bg = colors.clgn, bold = true })
hi("MiniStatuslineModeInsert",  { fg = colors.lv01, bg = colors.clyl, bold = true })
hi("MiniStatuslineModeVisual",  { fg = colors.lv01, bg = colors.clbl, bold = true })
hi("MiniStatuslineModeReplace", { fg = colors.lv01, bg = colors.clrd, bold = true })
hi("MiniStatuslineModeCommand", { fg = colors.lv01, bg = colors.clmg, bold = true })
hi("MiniStatuslineModeOther",   { fg = colors.lv01, bg = colors.clbn, bold = true })
hi("MiniStatuslineDevinfo",     { fg = colors.lv05, bg = colors.lv01 })
hi("MiniStatuslineFilename",    { fg = colors.lv05, bg = colors.lv01 })
hi("MiniStatuslineFileinfo",    { fg = colors.lv05, bg = colors.lv02 })
hi("MiniStatuslineInactive",    { fg = colors.lv04, bg = colors.lv01 })

-- =============================================
-- LSP and Tree-sitter Highlighting
-- =============================================
hi("@module",                   { fg = colors.clcy    })
hi("@lsp.type.parameter",       { fg = colors.lv05    })
hi("@lsp.type.property",        { fg = colors.lv05    })
hi("@variable",                 { link = "Identifier" })
hi("@keyword",                  { link = "Keyword"    })
hi("@lsp.type.interface",       { link = "Type"       })
hi("@lsp.type.decorator",       { link = "Constant"   })
hi("@lsp.type.macro",           { link = "Macro"      })
hi("@lsp.type.formatSpecifier", { link = "Special"    })
hi("@function.macro",           { link = "Macro"      })

-- =============================================
-- Plugin: Telescope
-- =============================================
hi("TelescopeBorder",       { fg = colors.lv02 })
hi("TelescopePromptTitle",  { fg = colors.clgn })
hi("TelescopeResultsTitle", { fg = colors.clmg })
hi("TelescopePreviewTitle", { fg = colors.clyl })
hi("TelescopeMatching",     { fg = colors.clyl })
hi("TelescopeSelection",    { link = "Visual"  })
hi("TelescopePreviewLine",  { link = "Visual"  })

-- =============================================
-- Plugin: Oil
-- =============================================
hi("OilHidden",           { fg = colors.lv04        })
hi("OilLink",             { fg = colors.clcy        })
hi("OilDirHidden",        { link = "OilDir"         })
hi("OilSocketHidden",     { link = "OilSocket"      })
hi("OilLinkHidden",       { link = "OilLink"        })
hi("OilOrphanLinkHidden", { link = "OilOrpahanLink" })
hi("OilLinkTarget",       { link = "OilLink"        })
hi("OilLinkTargetHidden", { link = "OilLinkTarget"  })
hi("OilFileHidden",       { link = "OilHidden"      })

-- =============================================
-- Plugin: LSP Diagnostics
-- =============================================
hi("DiagnosticError",         { fg = colors.clrd })
hi("DiagnosticWarn",          { fg = colors.clyl })
hi("DiagnosticInfo",          { fg = colors.clbl })
hi("DiagnosticHint",          { fg = colors.clcy })
hi("DiagnosticOk",            { fg = colors.clgn })
hi("LspReferenceText",        { bg = colors.lv02 })
hi("LspReferenceRead",        { bg = colors.lv02 })
hi("LspReferenceWrite",       { bg = colors.lv02 })
hi("LspCodeLens",             { fg = colors.lv03, italic = true    })
hi("DiagnosticUnderlineError",{ fg = colors.clrd, underline = true })
hi("DiagnosticUnderlineWarn", { fg = colors.clyl, underline = true })
hi("DiagnosticUnderlineInfo", { fg = colors.clbl, underline = true })
hi("DiagnosticUnderlineHint", { fg = colors.clcy, underline = true })

-- =============================================
-- Plugin: Treesitter
-- =============================================
hi("@constructor",      { fg = colors.clbl    })
hi("@tag.delimiter",    { fg = colors.clbn    })
hi("@tag.attribute",    { fg = colors.clyl    })
hi("@text.literal",     { fg = colors.clgn    })
hi("@text.reference",   { fg = colors.clcy    })
hi("@variable.builtin", { link = "Identifier" })
hi("@constant.builtin", { link = "Constant"   })
hi("@function.builtin", { link = "Function"   })
hi("@type.builtin",     { link = "Type"       })
hi("@text.title",       { fg = colors.clbl, bold = true      })
hi("@text.uri",         { fg = colors.clbl, underline = true })
hi("@text.todo",        { fg = colors.clbl, bg = colors.lv01 })
hi("@text.note",        { fg = colors.clgn, bg = colors.lv01 })
hi("@text.warning",     { fg = colors.clyl, bg = colors.lv01 })
hi("@text.danger",      { fg = colors.clrd, bg = colors.lv01 })

-- =============================================
-- Plugin: Blink Cmp
-- =============================================
hi("BlinkCmpGhostText",         { fg = colors.lv02    })
hi("BlinkCmpKind",              { link = "Normal"     })
hi("BlinkCmpKindText",          { link = "Normal"     })
hi("BlinkCmpKindMethod",        { link = "Function"   })
hi("BlinkCmpKindFunction",      { link = "Function"   })
hi("BlinkCmpKindConstructor",   { link = "Function"   })
hi("BlinkCmpKindField",         { link = "Identifier" })
hi("BlinkCmpKindVariable",      { link = "Identifier" })
hi("BlinkCmpKindClass",         { link = "Type"       })
hi("BlinkCmpKindInterface",     { link = "Type"       })
hi("BlinkCmpKindModule",        { link = "@module"    })
hi("BlinkCmpKindProperty",      { link = "Identifier" })
hi("BlinkCmpKindUnit",          { link = "Constant"   })
hi("BlinkCmpKindValue",         { link = "Constant"   })
hi("BlinkCmpKindEnum",          { link = "Type"       })
hi("BlinkCmpKindKeyword",       { link = "Keyword"    })
hi("BlinkCmpKindSnippet",       { link = "String"     })
hi("BlinkCmpKindColor",         { link = "Normal"     })
hi("BlinkCmpKindFile",          { link = "Normal"     })
hi("BlinkCmpKindReference",     { link = "Normal"     })
hi("BlinkCmpKindFolder",        { link = "Normal"     })
hi("BlinkCmpKindEnumMember",    { link = "Constant"   })
hi("BlinkCmpKindConstant",      { link = "Constant"   })
hi("BlinkCmpKindStruct",        { link = "Type"       })
hi("BlinkCmpKindEvent",         { link = "Normal"     })
hi("BlinkCmpKindOperator",      { link = "Normal"     })
hi("BlinkCmpKindTypeParameter", { link = "Identifier" })
hi("BlinkCmpMenuSelection",     { link = "Visual"     })

-- =============================================
-- Plugin: Todo comments
-- =============================================
-- PERF
hi("TodoBgPERF", { fg = colors.lv00, bg = colors.clmg })
hi("TodoFgPERF", { fg = colors.clmg })
hi("TodoSignPERF", { fg = colors.clmg })

-- HACK
hi("TodoBgHACK", { fg = colors.lv00, bg = colors.clor })
hi("TodoFgHACK", { fg = colors.clor })
hi("TodoSignHACK", { fg = colors.clor })

-- TODO
hi("TodoFgTODO",   { fg = colors.clbl })
hi("TodoSignTODO", { fg = colors.clbl })
hi("TodoBgTODO",   { fg = colors.lv00, bg = colors.clbl })

-- NOTE
hi("TodoSignNOTE", { fg = colors.clgn })
hi("TodoBgNOTE",   { fg = colors.lv00, bg = colors.clgn })
hi("TodoFgNOTE",   { fg = colors.clgn, bold = true      })

-- FIX
hi("TodoSignFIX", { fg = colors.clrd })
hi("TodoBgFIX",   { fg = colors.lv00, bg = colors.clrd })
hi("TodoFgFIX",   { fg = colors.clrd, bold = true      })

-- WARN
hi("TodoFgWARN",   { fg = colors.clyl })
hi("TodoSignWARN", { fg = colors.clyl })
hi("TodoBgWARN",   { fg = colors.lv00, bg = colors.clyl })

-- TEST
hi("TodoFgTEST",   { fg = colors.clmg })
hi("TodoSignTEST", { fg = colors.clmg })
hi("TodoBgTEST",   { fg = colors.lv00, bg = colors.clmg })

-- =============================================
-- Plugin: Compile Mode
-- =============================================
hi("CompileModeMessageRow",       { fg = colors.clmg })
hi("CompileModeMessageCol",       { fg = colors.clcy })
hi("CompileModeError",            { fg = colors.clrd })
hi("CompileModeWarning",          { fg = colors.clyl })
hi("CompileModeInfo",             { fg = colors.clgn })
hi("CompileModeCommandOutput",    { fg = colors.clbl })
hi("CompileModeCheckResult",      { fg = colors.clbn })
hi("CompileModeDirectoryMessage", { link = "CompileModeCommandOutput"  })
hi("CompileModeOutputFile",       { link = "CompileModeMessageRow"     })
hi("CompileModeCheckTarget",      { link = "CompileModeCheckResult"    })
hi("CompileModeMessage",          { fg = colors.lv05, underline = true })
-- stylua: ignore end
