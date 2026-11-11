return {
  {
    "folke/noice.nvim",
    enabled = false,
  },

  {
    "hkupty/iron.nvim",
    branch = "master",
    keys = {
      { "<leader>rs", "<cmd>IronRepl<cr>", desc = "Iniciar REPL" },
      { "<leader>rr", "<cmd>IronRestart<cr>", desc = "Reiniciar REPL" },
      { "<leader>rf", "<cmd>IronFocus<cr>", desc = "Enfocar REPL" },
      { "<leader>rh", "<cmd>IronHide<cr>", desc = "Ocultar REPL" },
      { "<leader>sl", desc = "Enviar línea a REPL" },
      { "<leader>sc", desc = "Enviar bloque a REPL" },
    },
    config = function()
      local iron = require("iron.core")

      local function get_python_path()
        local buf_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
        local match = vim.fs.find({ ".venv" }, {
          upward = true,
          stop = vim.loop.os_homedir(),
          path = buf_dir,
        })

        if #match > 0 then
          local venv_python = match[1] .. "/bin/python"
          if vim.fn.executable(venv_python) == 1 then
            return { venv_python }
          end
        end

        local direct_venv = vim.fn.expand("~/genero_lab/.venv/bin/python")
        if vim.fn.executable(direct_venv) == 1 then
          return { direct_venv }
        end

        if vim.fn.executable("uv") == 1 then
          return { "uv", "run", "python" }
        end

        return { "python3" }
      end

      iron.setup({
        config = {
          repl_open_cmd = require("iron.view").split.vertical.botright(0.4),
          repl_definition = {
            python = {
              command = get_python_path,
            },
            r = {
              command = { "R", "--no-save" },
            },
          },
        },
        keymaps = {
          send_motion = "<leader>sc",
          visual_send = "<leader>sc",
          send_line = "<leader>sl",
        },
        ignore_blank_lines = true,
      })
    end,
  },

  {
    "jalvesaq/Nvim-R",
    ft = { "r", "rmd" },
    config = function()
      vim.g.R_auto_start = 1
      vim.g.R_assign = 2
      vim.g.R_source = ""
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },

  {
    "patstockwell/vim-monokai-tasty",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme vim-monokai-tasty")
    end,
  },
}
