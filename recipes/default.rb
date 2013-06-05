package "backupninja"
package "s3cmd"
package "duplicity"
package "python-boto"

# Deploy backup script
#
template "#{node['backup']['backup_script_path']}/dt-s3-backup.sh" do
  source "dt-s3-backup.sh.erb"
  owner "root"
  mode 0700
end

# Add Backupninja MongoDB scripts
%w(mongodb mongodb.helper).each do |f|
  cookbook_file "/usr/share/backupninja/#{f}" do
    source f
  end
end

# Deploy the S3 config
#
template "/root/.s3cfg" do
  source "s3cfg.erb"
  owner "root"
  mode 0600
end

# Temporarily store private key for import and remove it afterwards
#
directory "/tmp/backup" do
  owner "root"
  recursive true
end

file "/tmp/backup/private_key.txt" do
  content node['backup']['private_key']
  owner "root"
  mode 0600
end

execute "Import secret key" do
  command "sudo -u root -i gpg --allow-secret-key-import --import /tmp/backup/private_key.txt"
  action :run
  not_if do
    File.exists?("/root/.gnupg")
  end
end

file "/tmp/backup/private_key.txt" do
  action :delete
end
