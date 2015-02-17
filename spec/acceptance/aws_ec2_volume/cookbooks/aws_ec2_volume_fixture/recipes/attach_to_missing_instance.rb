include_recipe 'aws_ec2_volume_fixture'

ebs_test_node = search(:node, "*:#{node['test']}").first

aws_ec2_volume node['test'] do
  action [:create, :attach]
  availability_zone 'us-west-2a'
  size 10
  volume_type :io1
  iops 300
  instance_id 'i-12345678' # no dice
  device '/dev/xvdf'
end
