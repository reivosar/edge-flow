math.randomseed(os.time())

request = function()
    local temp = math.random(15, 30) + math.random()
    local hum = math.random(30, 70)
    local body = string.format('{"temperature": %.1f, "humidity": %d}', temp, hum)
    return wrk.format("POST", "/data", {["Content-Type"] = "application/json"}, body)
end
