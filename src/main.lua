local io = require 'io'
local json = require 'lib.json'
local Interpreter = require "src.interpreter"

local pathBaseName = 'asts/'
local fileName = arg[1]

if fileName == nil then
  print('No file name provided')
  return
end

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
interpreter:interpret(json.decode(readFile(pathBaseName .. fileName .. '.json')))
