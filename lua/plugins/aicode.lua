-- currently supprts only gemini provider _
-- check https://github.com/frankroeder/parrot.nvim for guide on ollama/openAI/anthropic models
local secrets = require("secrets")

local geminiProvider = {
    name = "gemini",
    endpoint = function(self)
        return "https://generativelanguage.googleapis.com/v1beta/models/"
        .. self._model
        .. ":streamGenerateContent?alt=sse"
    end,
    model_endpoint = function(self)
        return { "https://generativelanguage.googleapis.com/v1beta/models?key=" .. self.api_key }
    end,
    api_key = secrets.GEMINI_API_KEY,
    params = {
        chat = { temperature = 1.1, topP = 1, topK = 10, maxOutputTokens = 8192 },
        command = { temperature = 0.8, topP = 1, topK = 10, maxOutputTokens = 8192 },
    },
    topic = {
        model = "gemini-1.5-flash",
        params = { maxOutputTokens = 64 },
    },
    headers = function(self)
        return {
            ["Content-Type"] = "application/json",
            ["x-goog-api-key"] = self.api_key,
        }
    end,
    models = {
        "gemini-2.5-flash-preview-05-20",
        "gemini-2.5-pro-preview-05-06",
        "gemini-1.5-pro-latest",
        "gemini-1.5-flash-latest",
        "gemini-2.5-pro-exp-03-25",
        "gemini-2.0-flash-lite",
        "gemini-2.0-flash-thinking-exp",
        "gemma-3-27b-it",
    },
    preprocess_payload = function(payload)
        local contents = {}
        local system_instruction = nil
        for _, message in ipairs(payload.messages) do
            if message.role == "system" then
                system_instruction = { parts = { { text = message.content } } }
            else
                local role = message.role == "assistant" and "model" or "user"
                table.insert(
                    contents,
                    { role = role, parts = { { text = message.content:gsub("^%s*(.-)%s*$", "%1") } } }
                )
            end
        end
        local gemini_payload = {
            contents = contents,
            generationConfig = {
                temperature = payload.temperature,
                topP = payload.topP or payload.top_p,
                maxOutputTokens = payload.max_tokens or payload.maxOutputTokens,
            },
        }
        if system_instruction then
            gemini_payload.systemInstruction = system_instruction
        end
        return gemini_payload
    end,
    process_stdout = function(response)
        if not response or response == "" then
            return nil
        end
        local success, decoded = pcall(vim.json.decode, response)
        if
            success
            and decoded.candidates
            and decoded.candidates[1]
            and decoded.candidates[1].content
            and decoded.candidates[1].content.parts
            and decoded.candidates[1].content.parts[1]
            then
                return decoded.candidates[1].content.parts[1].text
            end
            return nil
        end
}

-- input boxes for normal and visual modes keybinds
local function parrot_input_and_run_visual(cmd)
    vim.ui.input({ prompt = "Parrot Prompt: " }, function(input)
        if input == nil then
            return
        end
        local range = "'<,'>"
        if input == "" then
            vim.cmd(range .. cmd)
        else
            vim.cmd(range .. cmd .. " " .. vim.fn.shellescape(input))
        end
    end)
end

local function parrot_input_and_run(cmd)
    vim.ui.input({ prompt = "Parrot Prompt: " }, function(input)
        if input == nil then
            return
        end
        if input == "" then
            vim.cmd(cmd)
        else
            vim.cmd(cmd .. " " .. vim.fn.shellescape(input))
        end
    end)
end


return {
    "frankroeder/parrot.nvim",
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim'},
    config = function ()
        require("parrot").setup {
            providers = {
                gemini = geminiProvider
            }
        }
        -- query on selected buffer 
        vim.keymap.set("v", "<leader>gr", function()
            parrot_input_and_run_visual("PrtRewrite")
        end)

        -- ask general question
        vim.keymap.set("n", "<leader>gq", function()
            parrot_input_and_run("PrtAsk")
        end)
    end
}
