return {
  enabledFeatures = {
    codeActions = true,
    diagnostics = false,
    documentHighlights = true,
    documentLink = true,
    documentSymbols = true,
    foldingRanges = true,
    formatting = true,
    hover = true,
    inlayHint = true,
    onTypeFormatting = true,
    selectionRanges = true,
    semanticHighlighting = true,
    completion = true,
  },
  indexing = {
    excluded_patterns = {
      '**/spec/**/*.rb',
    },
    excluded_gems = {},
    included_patterns = {},
    excluded_magic_comments = {},
  },
  -- formatter = 'standard',
  -- linters = { 'standard' },
  addonSettings = {
    ['Ruby LSP Rails'] = {
      enablePendingMigrationsPrompt = true,
    },
  },
}

