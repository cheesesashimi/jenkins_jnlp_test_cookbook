#
# Cookbook:: jenkins_jnlp_test
# Recipe:: default
#
# Copyright:: 2017, Zack Zlotnik, All Rights Reserved.

# Works around https://github.com/chef-cookbooks/jenkins/issues/602
node.rm('jenkins', 'executor', 'protocol')

include_recipe 'runit'
include_recipe 'java'

# This is used by the Jenkins cookbook. Do not change to a string.
node.run_state[:jenkins_private_key] = data_bag_item('ssh-keys', 'jenkins-admin')['private_key']

user 'jenkins'
group 'jenkins'

jenkins_jnlp_slave 'this-is-a-test' do
  action [:create, :connect]
  user 'jenkins'
  group 'jenkins'
  java_path '/usr/lib/jvm/java-1.8.0/bin/java'
  jvm_options '-Dfile.encoding=UTF8'
  executors 2
  usage_mode 'exclusive'
end

# EOF
