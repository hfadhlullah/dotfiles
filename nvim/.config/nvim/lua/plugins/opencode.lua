return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = {
    {
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {},
        picker = {
          actions = {
            opencode_send = function(...)
              return require("opencode").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },

  opts = {},

  keys = {
    { "<leader>o", nil, desc = "+opencode" },

    {
      "<leader>oa",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      desc = "Ask opencode",
      mode = { "n", "x" },
    },
    {
      "<leader>os",
      function()
        require("opencode").select()
      end,
      desc = "Select opencode action",
      mode = { "n", "x" },
    },
    {
      "<leader>ot",
      function()
        require("opencode").toggle()
      end,
      desc = "Toggle opencode",
      mode = { "n", "t" },
    },
    {
      "<leader>or",
      function()
        return require("opencode").operator("@this ")
      end,
      desc = "Send range to opencode",
      expr = true,
      mode = { "n", "x" },
    },
    {
      "<leader>ol",
      function()
        return require("opencode").operator("@this ") .. "_"
      end,
      desc = "Send line to opencode",
      expr = true,
      mode = "n",
    },
    {
      "<leader>ou",
      function()
        require("opencode").command("session.half.page.up")
      end,
      desc = "Scroll up",
      mode = "n",
    },
    {
      "<leader>od",
      function()
        require("opencode").command("session.half.page.down")
      end,
      desc = "Scroll down",
      mode = "n",
    },
  },

  config = function(_, opts)
    vim.g.opencode_opts = opts
    vim.o.autoread = true
  end,
}
