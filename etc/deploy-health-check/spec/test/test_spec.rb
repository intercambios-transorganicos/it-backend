require 'spec_helper'

server = ENV['SERVER_NAME']
image = ENV['IMAGE_NAME']

describe service('sshd') do
  it { should be_enabled }
  it { should be_running }
end

describe port(443) do
  it { should_not be_listening }
end

describe port(80) do
  it { should be_listening }
end

describe docker_container("#{image}:latest") do
  it { should exist }
end

describe docker_container("traefik:1.7-alpine") do
  it { should exist }
end

describe command("curl -i https://#{server}") do
  its(:stdout) { should match /200/ }
end
