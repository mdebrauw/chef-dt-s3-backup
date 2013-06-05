Description
===========
Deploys the backup script from https://github.com/zertrin/duplicity-backup

Requirements
============
- Backup file system
- Backup mongodb
- Backup MySQL

You need to schedule backups in a separate recipe, this just puts the backup software and keys in place.

Default Attributes
==========
Will add to this. For now:

  default["backup"]["backup_script_path"] = "/usr/local/bin"
  default["backup"]["aws_access_key_id"] = "Get from somewhere, e.g. databag"
  default["backup"]["aws_secret_access_key"] = "Get from somewhere, e.g. databag"
  default["backup"]["passphrase"] = "Get from somewhere, e.g. databag"
  default["backup"]["dest"] = "/var/backups" # Override with S3 destination
  default["backup"]["gpg_key"] = "Get from somewhere, e.g. databag"
  default["backup"]["root"] = "/"

