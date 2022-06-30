# -*- mode: ruby -*-
# vi: set ft=ruby :
#!/usr/bin/env ruby


image = "ubuntu/focal64"

vms = {
 'graylog' => {'memory' => '4096', 'cpus' => '2', 'ip' => '30', 'box' => "#{image}"},
}

Vagrant.configure('2') do |config|
  vms.each do |name, conf|
    config.vm.define "#{name}" do |my|
      my.vm.box = conf['box']
      my.vm.hostname = "#{name}.example.com"
      my.vm.network 'private_network', ip: "192.168.63.#{conf['ip']}"
      my.vm.provider 'virtualbox' do |vb|
        vb.memory = conf['memory']
        vb.name = "#{name}"
        vb.cpus = conf['cpus']
        vb.customize ["modifyvm", :id, "--groups", "/Labs"]
        end
#      my.vm.provision "ansible_local" do |ansible|
#        ansible.playbook = "playbook.yml"
#        ansible.become = true
#      end  
    end
  end
end


