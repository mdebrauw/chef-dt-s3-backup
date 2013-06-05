# Backup script defaults:
#
default["backup"]["backup_script_path"] = "/usr/local/bin"
default["backup"]["aws_access_key_id"] = "Set somewhere else, role or library cookbook"
default["backup"]["aws_secret_access_key"] = "Set somewhere else, role or library cookbook"
default["backup"]["passphrase"] = "Set somewhere else, role or library cookbook"
default["backup"]["dest"] = "~/backups"
default["backup"]["gpg_key"] = "Set somewhere else, role or library cookbook"
default["backup"]["root"] = "/"

# Todo:
# INCLIST
# EXCLIST
# LOG_FILE_OWNER = "root:root"

# Mysql backup script defaults
#
default["backup"]["databases"] = "all"

