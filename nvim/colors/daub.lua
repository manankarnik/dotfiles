local colors = dofile(os.getenv("HOME") .. "/.config/daub/gen/colors.lua")
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- stylua: ignore start
-- =============================================
-- Core UI Elements
-- =============================================
hi("Normal",      { fg = colors.lv05 })
hi("NormalFloat", { fg = colors.lv05, bg = colors.lv01 })
hi("CursorLine",  { bg = colors.lv01 })
hi("Visual",      { bg = colors.lv02 })
hi("LineNr",      { fg = colors.lv03 })
hi("CursorLineNr",{ fg = colors.clyl })
hi("StatusLine",  { fg = colors.lv05, bg = colors.lv01 })
hi("StatusLineNC",{ fg = colors.lv03, bg = colors.lv01 })
hi("Search",      { fg = colors.lv05, bg = colors.lv02 })
hi("CurSearch",   { fg = colors.lv01, bg = colors.clyl })
hi("IncSearch",   { fg = colors.lv01, bg = colors.clcy })
hi("Title",       { fg = colors.clbl })
hi("WinSeparator",{ fg = colors.lv02 })
hi("EndOfBuffer", { fg = colors.lv00 })

-- =============================================
-- Basic Syntax Highlighting
-- =============================================
-- Comments and documentation
hi("Comment", { fg = colors.lv04, italic = true })

-- Constants
hi("Constant", { fg = colors.clor })
hi("String", { fg = colors.clgn })
hi("Character", { fg = colors.clrd })
hi("Number", { link = "Constant" })
hi("Boolean", { link = "Constant" })
hi("Float", { link = "Constant" })

-- Identifiers
hi("Identifier", { fg = colors.lv05 })
hi("Function", { fg = colors.clbl })
hi("Operator", { fg = colors.lvl05 })

-- Control flow and statements
hi("Keyword", { fg = colors.clmg })
hi("Statement", { link = "Keyword" })
hi("Conditional", { link = "Keyword" })
hi("Repeat", { link = "Keyword" })
hi("Label", { fg = colors.clyl })
hi("Exception", { fg = colors.clrd })

-- Preprocessor directives
hi("PreProc", { link = "Type" })
hi("Include", { link = "Keyword" })
hi("Define", { link = "Keyword" })
hi("Macro", { fg = colors.clbl })
hi("PreCondit", { link = "Type" })

-- Type definitions
hi("Type", { fg = colors.clyl })
hi("StorageClass", { link = "Type" })
hi("Structure", { link = "Type" })
hi("Typedef", { link = "Type" })

-- Special elements
hi("Special", { fg = colors.clbn })
hi("SpecialChar", { link = "Special" })
hi("Tag", { fg = colors.clyl })
hi("Delimiter", { link = "Normal" })
hi("SpecialComment", { link = "Special" })
hi("Debug", { fg = colors.clrd })

-- Spell
hi("SpellBad", { sp = colors.clrd, undercurl = true })
hi("SpellCap", { sp = colors.clyl, undercurl = true })
hi("SpellRare", { sp = colors.clcy, undercurl = true })
hi("SpellLocal", { sp = colors.clgn, undercurl = true })

-- =============================================
-- Text Formatting and Error States
-- =============================================
hi("Underlined", { fg = colors.clrd, underline = true })
hi("Ignore", { fg = colors.lv00 })
hi("Error", { fg = colors.lv00, bg = colors.clrd })
hi("Todo", { fg = colors.clyl, bg = colors.lv01, bold = true })
hi("Bold", { bold = true })
hi("Italic", { italic = true })

-- =============================================
-- UI Components and Feedback
-- =============================================
hi("Directory", { fg = colors.clbl })
hi("ErrorMsg", { fg = colors.clrd, bg = colors.lv00 })
hi("FoldColumn", { fg = colors.clcy, bg = colors.lv01 })
hi("Folded", { fg = colors.lv03, bg = colors.lv01 })
hi("MatchParen", { fg = colors.clor, bg = colors.lv02, bold = true })
hi("ModeMsg", { fg = colors.lv05, bold = true })
hi("MoreMsg", { fg = colors.lv05, bold = true })
hi("Question", { fg = colors.clbl })
hi("Substitute", { fg = colors.lv01, bg = colors.clyl })
hi("SpecialKey", { fg = colors.lv03 })
hi("TooLong", { fg = colors.clrd })
hi("VisualNOS", { fg = colors.clrd })
hi("WarningMsg", { fg = colors.clrd })
hi("WildMenu", { fg = colors.clrd, bg = colors.clyl })
hi("Conceal", { fg = colors.clbl, bg = colors.lv00 })
hi("Cursor", { fg = colors.lv00, bg = colors.lv05 })
hi("NonText", { fg = colors.lv03 })
hi("SignColumn", { fg = colors.lv03 })
hi("ColorColumn", { bg = colors.lv01 })
hi("CursorColumn", { bg = colors.lv01 })
hi("QuickFixLine", { fg = colors.clyl, bg = colors.lv01 })

-- =============================================
-- Diff
-- =============================================
hi("Added", { fg = colors.clgn })
hi("Changed", { fg = colors.clyl })
hi("Removed", { fg = colors.clrd })
hi("DiffAdd", { fg = colors.clgn })
hi("DiffChange", { fg = colors.clyl })
hi("DiffDelete", { fg = colors.clrd })
hi("DiffText", { fg = colors.clcy })

-- =============================================
-- Menus and Navigation
-- =============================================
hi("PMenu", { fg = colors.lv05, bg = colors.lv01 })
hi("PMenuSel", { fg = colors.lv05, bg = colors.lv01 })
hi("PMenuThumb", { bg = colors.lv02 })
hi("TabLine", { fg = colors.lv03, bg = colors.lv01 })
hi("TabLineFill", { fg = colors.lv03, bg = colors.lv01 })
hi("TabLineSel", { fg = colors.lv04, bg = colors.lv01 })

-- =============================================
-- LSP and Tree-sitter Highlighting
-- =============================================
hi("@module", { fg = colors.clcy })
hi("@lsp.type.parameter", { fg = colors.lv05 })
hi("@lsp.type.property", { fg = colors.lv05 })
hi("@variable", { link = "Identifier" })
hi("@keyword", { link = "Keyword" })
hi("@lsp.type.interface", { link = "Type" })
hi("@lsp.type.decorator", { link = "Constant" })
hi("@lsp.type.macro", { link = "Macro" })
hi("@lsp.type.formatSpecifier", { link = "Special" })
hi("@function.macro", { link = "Macro" })

-- =============================================
-- Plugin: Telescope
-- =============================================
hi("TelescopeBorder", { fg = colors.lv02 })
hi("TelescopePromptTitle", { fg = colors.clgn })
hi("TelescopeResultsTitle", { fg = colors.clmg })
hi("TelescopePreviewTitle", { fg = colors.clyl })
hi("TelescopeSelection", { link = "Visual" })
hi("TelescopeMatching", { fg = colors.clyl })
hi("TelescopePreviewLine", { link = "Visual" })

-- =============================================
-- Plugin: Indent des
-- =============================================
hi("IblIndent", { fg = colors.lv03 })
hi("IblScope", { fg = colors.clbl })
hi("IblWhitespace", { fg = colors.lv00 })

-- =============================================
-- Plugin: Oil
-- =============================================
hi("OilHidden", { fg = colors.lv04 })
hi("OilDirHidden", { link = "OilDir" })
hi("OilSocketHidden", { link = "OilSocket" })
hi("OilLink", { fg = colors.clcy })
hi("OilLinkHidden", { link = "OilLink" })
hi("OilOrphanLinkHidden", { link = "OilOrpahanLink" })
hi("OilLinkTarget", { link = "OilLink" })
hi("OilLinkTargetHidden", { link = "OilLinkTarget" })
hi("OilFileHidden", { link = "OilHidden" })

-- =============================================
-- Plugin: LSP Diagnostics
-- =============================================
hi("DiagnosticError", { fg = colors.clrd })
hi("DiagnosticWarn", { fg = colors.clyl })
hi("DiagnosticInfo", { fg = colors.clbl })
hi("DiagnosticHint", { fg = colors.clcy })
hi("DiagnosticOk", { fg = colors.clgn })
hi("DiagnosticUnderlineError", { fg = colors.clrd, underline = true })
hi("DiagnosticUnderlineWarn", { fg = colors.clyl, underline = true })
hi("DiagnosticUnderlineInfo", { fg = colors.clbl, underline = true })
hi("DiagnosticUnderlineHint", { fg = colors.clcy, underline = true })
hi("LspReferenceText", { bg = colors.lv02 })
hi("LspReferenceRead", { bg = colors.lv02 })
hi("LspReferenceWrite", { bg = colors.lv02 })
hi("LspCodeLens", { fg = colors.lv03, italic = true })

-- =============================================
-- Plugin: Treesitter
-- =============================================
hi("@constructor", { fg = colors.clbl })
hi("@tag.delimiter", { fg = colors.clbn })
hi("@tag.attribute", { fg = colors.clyl })
hi("@text.title", { fg = colors.clbl, bold = true })
hi("@text.uri", { fg = colors.clbl, underline = true })
hi("@text.literal", { fg = colors.clgn })
hi("@text.reference", { fg = colors.clcy })
hi("@text.todo", { fg = colors.clbl, bg = colors.lv01 })
hi("@text.note", { fg = colors.clgn, bg = colors.lv01 })
hi("@text.warning", { fg = colors.clyl, bg = colors.lv01 })
hi("@text.danger", { fg = colors.clrd, bg = colors.lv01 })
hi("@variable.builtin", { link = "Identifier" })
hi("@constant.builtin", { link = "Constant" })
hi("@function.builtin", { link = "Function" })
hi("@type.builtin", { link = "Type" })

-- =============================================
-- Plugin: Cmp (Completion)
-- =============================================
hi("CmpItemAbbrDeprecated", { fg = colors.lv03, strikethrough = true })
hi("CmpItemAbbrMatch", { fg = colors.clbl })
hi("CmpItemAbbrMatchFuzzy", { fg = colors.clbl })
hi("CmpItemKind", { link = "Normal" })
hi("CmpItemKindConstant", { link = "Constant" })
hi("CmpItemKindVariable", { link = "Variable" })
hi("CmpItemKindInterface", { link = "Type" })
hi("CmpItemKindEnum", { link = "Type" })
hi("CmpItemKindEnumMember", { link = "Constant" })
hi("CmpItemKindModule", { link = "@module" })
hi("CmpItemKindText", { link = "Normal" })
hi("CmpItemKindFunction", { link = "Function" })
hi("CmpItemKindMethod", { link = "Function" })
hi("CmpItemKindKeyword", { link = "Keyword" })
hi("CmpItemKindStruct", { link = "Type" })
hi("CmpItemKindSnippet", { link = "String" })
hi("CmpItemKindProperty", { link = "@lsp.type.property" })
hi("CmpItemKindUnit", { fg = colors.clcy })

-- =============================================
-- Plugin: Blink Cmp
-- =============================================
hi("BlinkCmpLabelDeprecated", { fg = colors.lv03, strikethrough = true })
hi("BlinkCmpGhostText", { fg = colors.lv02 })
hi("BlinkCmpKind", { link = "Normal" })
hi("BlinkCmpKindText", { link = "Normal" })
hi("BlinkCmpKindMethod", { link = "Function" })
hi("BlinkCmpKindFunction", { link = "Function" })
hi("BlinkCmpKindConstructor", { link = "Function" })
hi("BlinkCmpKindField", { link = "Identifier" })
hi("BlinkCmpKindVariable", { link = "Identifier" })
hi("BlinkCmpKindClass", { link = "Type" })
hi("BlinkCmpKindInterface", { link = "Type" })
hi("BlinkCmpKindModule", { link = "@module" })
hi("BlinkCmpKindProperty", { link = "Identifier" })
hi("BlinkCmpKindUnit", { link = "Constant" })
hi("BlinkCmpKindValue", { link = "Constant" })
hi("BlinkCmpKindEnum", { link = "Type" })
hi("BlinkCmpKindKeyword", { link = "Keyword" })
hi("BlinkCmpKindSnippet", { link = "String" })
hi("BlinkCmpKindColor", { link = "Normal" })
hi("BlinkCmpKindFile", { link = "Normal" })
hi("BlinkCmpKindReference", { link = "Normal" })
hi("BlinkCmpKindFolder", { link = "Normal" })
hi("BlinkCmpKindEnumMember", { link = "Constant" })
hi("BlinkCmpKindConstant", { link = "Constant" })
hi("BlinkCmpKindStruct", { link = "Type" })
hi("BlinkCmpKindEvent", { link = "Normal" })
hi("BlinkCmpKindOperator", { link = "Normal" })
hi("BlinkCmpKindTypeParameter", { link = "Identifier" })
hi("BlinkCmpMenuSelection", { link = "Visual" })

-- =============================================
-- Plugin: Notify
-- =============================================
hi("NotifyERRORBorder", { fg = colors.clrd })
hi("NotifyWARNBorder", { fg = colors.clyl })
hi("NotifyINFOBorder", { fg = colors.clbl })
hi("NotifyDEBUGBorder", { fg = colors.lv03 })
hi("NotifyTRACEBorder", { fg = colors.clcy })
hi("NotifyERRORIcon", { fg = colors.clrd })
hi("NotifyWARNIcon", { fg = colors.clyl })
hi("NotifyINFOIcon", { fg = colors.clbl })
hi("NotifyDEBUGIcon", { fg = colors.lv03 })
hi("NotifyTRACEIcon", { fg = colors.clcy })
hi("NotifyERRORTitle", { fg = colors.clrd })
hi("NotifyWARNTitle", { fg = colors.clyl })
hi("NotifyINFOTitle", { fg = colors.clbl })
hi("NotifyDEBUGTitle", { fg = colors.lv03 })
hi("NotifyTRACETitle", { fg = colors.clcy })

-- =============================================
-- Plugin: Bufferline
-- =============================================
hi("BufferLineFill", { bg = colors.lv01 })
hi("BufferLinelv00", { fg = colors.lv03, bg = colors.lv01 })
hi("BufferLineBufferVisible", { fg = colors.lv05, bg = colors.lv01 })
hi("BufferLineBufferSelected", { fg = colors.lv05, bg = colors.lv02, bold = true })
hi("BufferLineTab", { fg = colors.lv03, bg = colors.lv01 })
hi("BufferLineTabSelected", { fg = colors.lv05, bg = colors.lv02 })
hi("BufferLineTabClose", { fg = colors.clrd, bg = colors.lv01 })
hi("BufferLineIndicatorSelected", { fg = colors.clgn, bg = colors.lv02 })
hi("BufferLineSeparator", { fg = colors.lv02, bg = colors.lv01 })
hi("BufferLineSeparatorSelected", { fg = colors.lv02, bg = colors.lv02 })
hi("BufferLineTabSeparator", { link = "BufferLineSeparator" })
hi("BufferLineTabSeparatorSelected", { link = "BufferLineSeparatorSelected" })
hi("BufferLineModified", { fg = colors.clyl, bg = colors.lv01 })
hi("BufferLineModifiedVisible", { fg = colors.clyl, bg = colors.lv01 })
hi("BufferLineModifiedSelected", { fg = colors.clyl, bg = colors.lv02 })
hi("BufferLineCloseButton", { fg = colors.lv05, bg = colors.lv01 })
hi("BufferLineCloseButtonVisible", { fg = colors.lv05, bg = colors.lv01 })
hi("BufferLineCloseButtonSelected", { fg = colors.lv05, bg = colors.lv02 })

-- =============================================
-- Plugin: Dashboard
-- =============================================
hi("DashboardHeader", { fg = colors.clbl })
hi("DashboardCenter", { fg = colors.clgn })
hi("DashboardShortcut", { fg = colors.clmg })
hi("DashboardFooter", { fg = colors.lv03 })

-- =============================================
-- Plugin: Barbar
-- =============================================
hi("BufferCurrent", { fg = colors.lv05, bg = colors.lv02 })
hi("BufferCurrentIndex", { fg = colors.clgn, bg = colors.lv02 })
hi("BufferCurrentMod", { fg = colors.clyl, bg = colors.lv02 })
hi("BufferCurrentSign", { fg = colors.clgn, bg = colors.lv02 })
hi("BufferCurrentTarget", { fg = colors.clrd, bg = colors.lv02, bold = true })
hi("BufferVisible", { fg = colors.lv05, bg = colors.lv01 })
hi("BufferVisibleIndex", { fg = colors.lv05, bg = colors.lv01 })
hi("BufferVisibleMod", { fg = colors.clyl, bg = colors.lv01 })
hi("BufferVisibleSign", { fg = colors.lv05, bg = colors.lv01 })
hi("BufferVisibleTarget", { fg = colors.clrd, bg = colors.lv01, bold = true })
hi("BufferInactive", { fg = colors.lv03, bg = colors.lv01 })
hi("BufferInactiveIndex", { fg = colors.lv03, bg = colors.lv01 })
hi("BufferInactiveMod", { fg = colors.clyl, bg = colors.lv01 })
hi("BufferInactiveSign", { fg = colors.lv03, bg = colors.lv01 })
hi("BufferInactiveTarget", { fg = colors.clrd, bg = colors.lv01, bold = true })

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
hi("TodoBgTODO", { fg = colors.lv00, bg = colors.clbl })
hi("TodoFgTODO", { fg = colors.clbl })
hi("TodoSignTODO", { fg = colors.clbl })

-- NOTE
hi("TodoBgNOTE", { fg = colors.lv00, bg = colors.clgn })
hi("TodoFgNOTE", { fg = colors.clgn, bold = true })
hi("TodoSignNOTE", { fg = colors.clgn })

-- FIX
hi("TodoBgFIX", { fg = colors.lv00, bg = colors.clrd })
hi("TodoFgFIX", { fg = colors.clrd, bold = true })
hi("TodoSignFIX", { fg = colors.clrd })

-- WARN
hi("TodoBgWARN", { fg = colors.lv00, bg = colors.clyl })
hi("TodoFgWARN", { fg = colors.clyl })
hi("TodoSignWARN", { fg = colors.clyl })

-- TEST
hi("TodoBgTEST", { fg = colors.lv00, bg = colors.clmg })
hi("TodoFgTEST", { fg = colors.clmg })
hi("TodoSignTEST", { fg = colors.clmg })

-- =============================================
-- Plugin: Compile Mode
-- =============================================
hi("CompileModeMessage", { fg = colors.lv05, underline = true })
hi("CompileModeMessageRow", { fg = colors.clmg })
hi("CompileModeMessageCol", { fg = colors.clcy })
hi("CompileModeError", { fg = colors.clrd })
hi("CompileModeWarning", { fg = colors.clyl })
hi("CompileModeInfo", { fg = colors.clgn })
hi("CompileModeCommandOutput", { fg = colors.clbl })
hi("CompileModeDirectoryMessage", { link = "CompileModeCommandOutput" })
hi("CompileModeOutputFile", { link = "CompileModeMessageRow" })
hi("CompileModeCheckResult", { fg = colors.clbn })
hi("CompileModeCheckTarget", { link = "CompileModeCheckResult" })
-- stylua: ignore end
