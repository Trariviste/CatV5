local cloneref = cloneref or function(instance) return instance end
local httpservice = cloneref(game.GetService(game, 'HttpService'))

local function run(func)
    func()
end

local API = {}
run(function()
    local request

    API.New = function(url, method, catvapeurl) -- string, string, boolean
        local addition = catvapeurl and "https://catvape.vercel.app/" or ""
        
        request = http.request({
            Url = addition..url, -- replace with files/main or whatever files needed
            Method = method
        })
    
        API.Main = request
        API.GetHeader = function(header)
            return request.Headers[header]
        end
        API.GetAllHeaders = function()
            return request.Headers
        end
        API.Body = request.Body
        API.StatusCode = request.StatusCode
        API.Get = function(name)
            local data = httpservice:JSONDecode(request.Body)
    
            return data[name]
        end
    end
end)

return API
