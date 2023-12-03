local http = require("socket.http")
local url = "https://api.chucknorris.io/jokes/random"
-- local url = "https://httpbin.org/get"
local output_string = "Loading..."

function love.load()
    -- Make the HTTP request
    local response, status, headers = http.request(url)

    if status == 200 then
        -- Parse the JSON response
        local json = require("json")  -- Assuming you have a JSON library available
        local data = json.decode(response)
        
        -- Extract the joke from the JSON data
        output_string = data.value or "Failed to fetch joke"
    else
        output_string = "Failed to fetch joke. Status: " .. status
    end
end

function love.draw()
    love.graphics.print(output_string, 400, 300)
end
