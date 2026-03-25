return {
  virtualtext = {
    auto_trigger_ft = {},
    keymap = {
      accept = "<A-A>",
      accept_line = "<A-a>",
      accept_n_lines = "<A-z>",
      prev = "<A-[>",
      next = "<A-]>",
      dismiss = "<A-e>",
    },
  },

  provider = "openai_compatible",
  request_timeout = 2.5,
  throttle = 1500, -- Increase to reduce costs and avoid rate limits
  debounce = 600, -- Increase to reduce costs and avoid rate limits
  provider_options = {
    openai_compatible = {
      api_key = "OPENROUTER_API_KEY",
      end_point = "https://openrouter.ai/api/v1/chat/completions",
      model = "google/gemini-3.1-flash-lite-preview",
      name = "OpenRouter",
      optional = {
        max_tokens = 256,
        reasoning = {
          effort = "none",
        },
        provider = {
          -- Prioritize throughput for faster completion
          sort = "throughput",
        },
      },
    },
  },
}
