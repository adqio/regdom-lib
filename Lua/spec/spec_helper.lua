local yaml = require 'yaml'

function read_yaml( file_name)
  local full_path = "./spec/"..file_name
  local file  = io.open(full_path,"r")
  local fixtures_yaml = file:read("*all")
  file:close()
  local fixtures = yaml.load(fixtures_yaml)
  return fixtures
end