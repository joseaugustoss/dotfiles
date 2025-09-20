-- ~/.config/nvim/lua/plugins/dev.lua
return {

  ---------------------------------------------------------------------------
  -- Treesitter: suporte para todas as stacks
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Frontend
        "html", "css", "scss", "javascript", "typescript", "tsx", "vue",
        "json", "jsonc", "yaml", "markdown",

        -- Backend
        "bash", "dockerfile", "go", "gomod", "gosum", "gowork",
        "c", "cpp", "python", "ruby", "lua",

        -- Mobile
        "dart", "kotlin", "java", "swift",
      },
      autotag = { enable = true },
    },
  },

  ---------------------------------------------------------------------------
  -- Fechamento/renomeio automático de tags (HTML, JSX, Vue, etc.)
  ---------------------------------------------------------------------------
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  ---------------------------------------------------------------------------
  -- Colorização de cores (CSS, Tailwind)
  ---------------------------------------------------------------------------
  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        tailwind = true,
      },
    },
  },

  ---------------------------------------------------------------------------
  -- LSPs
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- FRONTEND
        html = {},
        cssls = {},
        emmet_ls = {
          filetypes = {
            "html", "css", "scss",
            "javascript", "javascriptreact",
            "typescript", "typescriptreact",
            "vue", "svelte", "astro",
          },
        },
        tailwindcss = {},
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "all" },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
              },
            },
          },
        },
        volar = { filetypes = { "vue" } },

        -- BACKEND
        eslint = {}, -- opcional
        gopls = {
          settings = {
            gopls = {
              analyses = { unusedparams = true, shadow = true },
              staticcheck = true,
            },
          },
        },
        clangd = { cmd = { "clangd", "--background-index", "--clang-tidy" } },
        pyright = {},
        ruff_lsp = {},
        solargraph = {},
        dockerls = {},
        yamlls = {},
        lua_ls = {
          settings = { Lua = { diagnostics = { globals = { "vim" } } } },
        },

        -- MOBILE
        dartls = {
          cmd = { "dart", "language-server", "--protocol=lsp" },
          filetypes = { "dart" },
          init_options = {
            closingLabels = true,
            flutterOutline = true,
            onlyAnalyzeProjectsWithOpenFiles = true,
            outline = true,
            suggestFromUnimportedLibraries = true,
          },
        },
        kotlin_language_server = {},
        jdtls = {},
        sourcekit = { filetypes = { "swift" } },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Mason (LSPs, linters, formatters, debug adapters)
  ---------------------------------------------------------------------------
{
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      -- Agora, a instalação será automática.
      -- O Mason-nvim-dap vai instalar todos os adaptadores listados aqui.
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "js-debug-adapter",
          "python",
          "delve",
          "cppdbg",
          "dart",
          "java-debug-adapter",
          "kotlin-debug-adapter",
          "codelldb",
        },
        -- Removemos a linha `automatic_installation = false`
      })
      require("dapui").setup()
    end,
  },

  ---------------------------------------------------------------------------
  -- Format on save (Conform)
  ---------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 2000,
      },
      formatters_by_ft = {
        -- Frontend
        javascript = { "eslint_d", "prettierd" },
        typescript = { "eslint_d", "prettierd" },
        javascriptreact = { "eslint_d", "prettierd" },
        typescriptreact = { "eslint_d", "prettierd" },
        vue = { "eslint_d", "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },

        -- Backend
        go = { "gofmt", "goimports" },
        cpp = { "clang_format" },
        c = { "clang_format" },
        python = { "ruff_format" },
        ruby = { "rubocop" },
        lua = { "stylua" },
        sh = { "shfmt" },

        -- Mobile
        dart = { "dart_format" },
        kotlin = { "ktlint" },
        java = { "google_java_format" },
        swift = { "swiftformat" },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Snippets
  ---------------------------------------------------------------------------
  {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  },

  ---------------------------------------------------------------------------
  -- Debug Adapter Protocol (DAP)
  ---------------------------------------------------------------------------
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio", -- dependência obrigatória do dap-ui
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "js-debug-adapter",      -- Node / JS / TS (moderno)
          "python",                -- Debugpy
          "delve",                 -- Go
          "cppdbg",                -- C/C++
          "dart",                  -- Flutter
          "java-debug-adapter",    -- Java
          "kotlin-debug-adapter",  -- Kotlin
          "codelldb",              -- Swift / Obj-C
        },
        automatic_installation = false,
      })
      require("dapui").setup()
    end,
  },
}
