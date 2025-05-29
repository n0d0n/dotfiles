--[[
  Plugin configuration for CopilotChat.nvim, an AI-powered code assistant for Neovim.
  This file sets up plugin dependencies, key mappings, prompt templates, and custom commands
  to enhance code review, refactoring, documentation, and more, using AI chat capabilities.
--]]

local IS_DEV = false -- Set to true to use a local development version of CopilotChat.nvim

-- Predefined prompt templates for various AI-assisted actions
local prompts = {
  Explain = "Explica como funciona el código proporcionado.",
  Review = "Revisa el código y proporciona sugerencias de mejora.",
  Tests = "Analiza como funciona el código, luego genera test unitarios.",
  Refactor = "Refactoriza el código para mejorar claridad y legibilidad.",
  FixCode = "Soluciona los problemas en el código para que funcione correctamente.",
  FixError = "Explica el error y proporciona una solución.",
  BetterNamings = "Proporciona mejores nombres a variables y funciones.",
  Documentation = "Documenta el siguiente código.",
  SwaggerApiDocs = "Proporciona documentación para esta API usando Swagger.",
  SwaggerJsDocs = "Escribe JSDoc para esta API usando Swagger.",
  Summarize = "Haz un resumen de este texto.",
  Spelling = "Corrige errores gramaticales y sintácticos del texto.",
  Wording = "Mejora la gramática y la forma de expresarse de este texto.",
  Concise = "Reescribe este texto para hacerlo más conciso.",
}

return {
  -- Optional: Integration with which-key.nvim for keybinding discovery
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a",  group = "ai" },           -- Group for AI-related actions
        { "<leader>gm", group = "Copilot Chat" }, -- Group for Copilot Chat actions
      },
    },
  },
  -- Optional: Render markdown in chat buffers for better readability
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      file_types = { "markdown", "copilot-chat" }, -- Enable for markdown and copilot-chat filetypes
    },
    ft = { "markdown", "copilot-chat" },
  },
  -- Main CopilotChat.nvim plugin configuration
  {
    dir = IS_DEV and "~/Projects/research/CopilotChat.nvim" or nil, -- Use local dev path if IS_DEV is true
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "nvim-telescope/telescope.nvim" }, -- Required for fuzzy finding and selection
      { "nvim-lua/plenary.nvim" },         -- Utility functions
    },
    opts = {
      question_header = "## n0d0n }:<", -- Header for user questions in chat
      answer_header = "## AI",          -- Header for AI answers in chat
      error_header = "## Error ",       -- Header for error messages
      -- System prompt to instruct the AI assistant on its behavior and language
      system_prompt =
      "Eres el asistente personal de análisis de código a nivel de seguridad, buenas prácticas, clean code y refactorización del usuario n0d0n. Tu tarea es proporcionar respuestas detalladas, técnicas (pero amenas) para una mejor comprensión. Cuando se te solicita generar/modificar, tanto código como documentación, usa siempre inglés como lenguaje. Proporciona siempre una explicación de las soluciones proporcionadas.",
      prompts = prompts, -- Attach the predefined prompts
      -- model = "claude-3.7-sonnet",   -- (Optional) Specify the AI model to use
      mappings = {       -- Key mappings for chat actions
        complete = {
          detail = "Use @<Tab> or /<Tab> for options.",
          insert = "<Tab>",
        },
        close = {
          normal = "q",
          insert = "<C-c>",
        },
        reset = {
          normal = "<C-x>",
          insert = "<C-x>",
        },
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-CR>",
        },
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
        },
        show_help = {
          normal = "g?",
        },
      },
    },
    -- Plugin setup and custom command definitions
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)

      local select = require("CopilotChat.select")

      -- Define a command to ask CopilotChat with visual selection
      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      -- Define a command to ask CopilotChat inline (floating window) with visual selection
      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = "*", range = true })

      -- Define a command to ask CopilotChat with the entire buffer as context
      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*", range = true })

      -- Auto command to set line numbers and filetype for copilot-chat buffers
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-*",
        callback = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = true

          local ft = vim.bo.filetype
          if ft == "copilot-chat" then
            vim.bo.filetype = "markdown" -- Render chat as markdown for better readability
          end
        end,
      })
    end,
    event = "VeryLazy", -- Load plugin on a lazy event for performance
    -- Key mappings for CopilotChat actions
    keys = {
      {
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt({
            context = {
              "buffers",
            },
          })
        end,
        desc = "CopilotChat - Prompt actions",
      },
      {
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt()
        end,
        mode = "x",
        desc = "CopilotChat - Prompt actions",
      },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>",       desc = "CopilotChat - Explain code" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>",         desc = "CopilotChat - Generate tests" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>",        desc = "CopilotChat - Review code" },
      { "<leader>aR", "<cmd>CopilotChatRefactor<cr>",      desc = "CopilotChat - Refactor code" },
      { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
      {
        "<leader>av",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ax",
        ":CopilotChatInline",
        mode = "x",
        desc = "CopilotChat - Inline chat",
      },
      {
        "<leader>ai",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      {
        "<leader>am",
        "<cmd>CopilotChatCommit<cr>",
        desc = "CopilotChat - Generate commit message for all changes",
      },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CopilotChatBuffer " .. input)
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      { "<leader>af", "<cmd>CopilotChatFixError<cr>", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>al", "<cmd>CopilotChatReset<cr>",    desc = "CopilotChat - Clear buffer and chat history" },
      { "<leader>av", "<cmd>CopilotChatToggle<cr>",   desc = "CopilotChat - Toggle" },
      { "<leader>a?", "<cmd>CopilotChatModels<cr>",   desc = "CopilotChat - Select Models" },
      { "<leader>aa", "<cmd>CopilotChatAgents<cr>",   desc = "CopilotChat - Select Agents" },
    },
  },
}
