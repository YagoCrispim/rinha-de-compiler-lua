local io = require 'io'
local json = require 'lib.json'
local Interpreter = require "src.interpreter"

local function readFile(path)
  local file = io.open(path, 'r')
  if file == nil then
    return nil
  end
  local content = file:read('*a')
  file:close()
  return content
end

local interpreter = Interpreter:new()
-- local fileName = '/var/rinha/source.rinha.json'
local fileName = './asts/print_function.json'
interpreter:interpret(json.decode(readFile(fileName)))
