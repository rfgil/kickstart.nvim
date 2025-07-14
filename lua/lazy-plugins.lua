-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-fugitive', dependencies = { 'tpope/vim-rhubarb' } },

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- modular approach: using `require 'path.name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'kickstart.plugins.gitsigns',

  require 'kickstart.plugins.which-key',

  require 'kickstart.plugins.telescope',

  require 'kickstart.plugins.lspconfig',

  require 'kickstart.plugins.conform',

  require 'kickstart.plugins.blink-cmp',

  require 'kickstart.plugins.tokyonight',

  require 'kickstart.plugins.todo-comments',

  require 'kickstart.plugins.mini',

  require 'kickstart.plugins.treesitter',

  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_log_repeat = 'time',
        calendar = {},
        org_id_method = 'uuid',
        org_agenda_span = 'week',
        org_agenda_files = '~/Desktop/notes/*.org',
        org_default_notes_file = '~/Desktop/notes/refile.org',
        org_capture_templates = {
          t = { description = 'Task', template = '* TODO %?\\n  %u' },
          j = { description = 'Journal', template = '* %U %?\\n  %i\\n  %a' },
          n = { description = 'Note', template = '* %U %?\\n  %i\\n  %a' },
        },
        org_adapt_indentation = false,
      }
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      update_focused_file = {
        enable = true,
      },
      filters = {
        custom = { '.DS_Store' },
        git_ignored = false,
      },
      filesystem_watchers = {
        ignore_dirs = {
          'node_modules',
        },
      },
    },
    config = function(_, opts)
      require('nvim-tree').setup(opts)

      vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
      vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>', { desc = 'Toggle file explorer on current file' })
      vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
      vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })

      -- disable newtr
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- vim-fugitive :Browse relies on netwr
      -- updating that use systems open: https://vi.stackexchange.com/questions/38447/vim-fugitive-netrw-not-found-define-your-own-browse-to-use-gbrowse
      vim.api.nvim_create_user_command('Browse', function(opts1)
        vim.fn.system { 'open', opts1.fargs[1] }
      end, { nargs = 1 })
    end,
  },
  {
    'github/copilot.vim',
    config = function()
      vim.api.nvim_set_keymap('i', '<C-C>', 'copilot#Accept(\"<CR>\")', { silent = false, expr = true })
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
  },

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
