# -*- mode: ruby -*-
# vi: set ft=ruby :
#!/usr/bin/env ruby


image = "ubuntu/focal64"

vms = {
 'k3s-master' => {'memory' => '4096', 'cpus' => '2', 'ip' => '10', 'box' => "#{image}"},
 'k3s-worker1' => {'memory' => '2048', 'cpus' => '2', 'ip' => '20', 'box' => "#{image}"},
 'k3s-worker2' => {'memory' => '2048', 'cpus' => '2', 'ip' => '30', 'box' => "devopsbox/centos-8.5"},
}

Vagrant.configure('2') do |config|
  vms.each do |name, conf|
     config.vm.define "#{name}" do |my|
       my.vbguest.auto_update = false
       my.vm.box = conf['box']
       my.vm.hostname = "#{name}.example.com"
       my.vm.network 'private_network', ip: "192.168.56.#{conf['ip']}"
       my.vm.provider 'virtualbox' do |vb|
          vb.memory = conf['memory']
          vb.name = "#{name}"
          vb.cpus = conf['cpus']
          vb.customize ["modifyvm", :id, "--groups", "/Labs"]
       end
       my.vm.provision "shell", path: "provision.sh"
     end
  end
end

