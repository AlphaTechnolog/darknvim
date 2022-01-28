local config = {}
local consts = require('consts')

config.colorscheme = 'tokyonight'

config.lualine = {
  theme = 'tokyonight'
}

config.tabbar = {
  backend = 'bufferline', -- lualine | bufferline | none: none to don't load tabbar
  options = {}, -- the options for the backend
}

config.plugins = {
  -- with this you can add more plugins into your private config
  -- write your plugins like the packer `use` function parameter
  -- e.g:
  -- {'navarasu/onedark.nvim', as = 'onedark'}
  additional_plugins = {},
  to_enable = {
    nvim_tree = { has_mappings = true, has_autocmds = true },
    telescope = { has_mappings = true },
    bufferline = {},
    lualine = {},
    treesitter = {},
    colorizer = {},
    autopairs = {},
    cmp = {},
    lspinstaller = {},
    lspcolors = {},
    cosmic_ui = {},
    notify = {},
  },
  specify = {
    tokyonight = {
      style = 'night',
    },
    material = {
      style = 'deep ocean',
      options = {},
    },
    onedark = {
      style = 'dark',
    },
    notify = {
      options = {
        -- in this table you can override the default configuration settings for
        -- nvim notify, see `lua/plugconfigs/notify.lua`
      },
    },
    nvim_tree = {
      open_at_startup = true,
    },
    treesitter = {
      ensure_installed = {
        'lua',
        'vim',
        'javascript',
        'cpp',
      },
      sync_installed = true,
    },
  },
}

config.lsp = {
  misc = {
    signature = true,
    cosmic_ui = {
      rename = true,
      code_actions = true,
    },
  },
  servers = {
    tsserver = consts.NIL,
    pylsp = consts.NIL,
    vuels = consts.NIL,
    clangd = consts.NIL,
    emmet_ls = consts.NIL,
    sumneko_lua = function()
      local runtime_path = vim.split(package.path, ';')
      table.insert(runtime_path, 'lua/?.lua')
      table.insert(runtime_path, 'lua/?/init.lua')

      return {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
              path = runtime_path,
            },
            diagnostics = {
              globals = {'vim'},
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          }
        }
      }
    end
  },
}

config.custom = {
  load = {
    autocmds = false,
    general = false,
    mappings = false,
  },
}

return config

