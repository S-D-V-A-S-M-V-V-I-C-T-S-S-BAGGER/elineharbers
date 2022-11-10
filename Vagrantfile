# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Set the default provider to docker
  ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
  ENV['VAGRANT_NO_PARALLEL'] = 'true'


  ##
  # HUGO
  ##
  config.vm.define "hugo" do |web|
    web.vm.network :private_network, type: "dhcp"
    web.vm.hostname = "www-dev.elineharbers.nl"
    web.vm.provider "docker" do |d|
      d.image = "klakegg/hugo:0.81.0-ext-alpine"
      d.name = "elineharbers.nl"
      d.ports = ["80:80"]

      d.cmd = ["server", "-D", "-p 80", "-s /vagrant"]

      d.has_ssh = false
      d.remains_running = true
    end
  end


  ##
  # DNS
  ##
  config.vm.define "dns", autostart: false do |dns|
    dns.vm.provider "docker" do |d|
      d.image = "dvdarias/docker-hoster"
      d.name = "docker-hoster"
      d.volumes = [
        "/etc/hosts:/tmp/hosts",
        "/var/run/docker.sock:/tmp/docker.sock"
      ]

      d.has_ssh = false
      d.remains_running = true
    end
  end
  
end

