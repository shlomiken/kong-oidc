local M = {}

local function shouldIgnoreRequest(patterns)
  if (patterns) then
    for _, pattern in ipairs(patterns) do
      local isMatching = not (string.find(ngx.var.request_uri, pattern) == nil)
      ngx.log(ngx.DEBUG, "OidcHandler Matching " .. pattern .. " with " .. ngx.var.request_uri)
      if (isMatching) then return true end
    end
  end
  return false
end

function M.shouldProcessRequest(config)
  return not shouldIgnoreRequest(config.filters)
end

return M
