CloudFormation do
  Description 'connectworker service'
  
LaunchConfiguration(:connectWorkerLaunchConfiguration) do
  EbsOptimized true
  IamInstanceProfile null
  ImageId ami-026e9e583bf07479b
  InstanceMonitoring true
  InstanceType t2.micro
  KeyName 'ramki'
  SecurityGroups sg-0a569314871ab20c4
  UserData FnBase64(user_data) /userdata/cloud-config.yaml.erb
end

AutoScalingGroup(:connectworkerScalingGroup) do
  LaunchConfigurationName Ref(:connectWorkerLaunchConfiguration)
  DesiredCapacity 3
  MinSize 3
  MaxSize 3
  
